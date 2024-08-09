resource "azurerm_data_factory_managed_private_endpoint" "kv_adf_pe" {
  name               = "pep-${var.adf_name}_${var.key_vault_name}-vault"
  data_factory_id    = module.adf[0].data_factory_id
  target_resource_id = module.kv[0].resource_id

  subresource_name = "vault"
}

resource "azurerm_data_factory_managed_private_endpoint" "sql_adf_pe" {
  name               = "pep-${var.adf_name}_${var.sql_srv_name}-vault"
  data_factory_id    = module.adf[0].data_factory_id
  target_resource_id = module.sql[0].sql_server.id

  subresource_name = "sqlServer"
}

data "azapi_resource" "key_vault_private_endpoint_connection" {
  type                   = "Microsoft.KeyVault/vaults@2023-07-01"
  resource_id            = module.kv[0].resource_id
  response_export_values = ["properties.privateEndpointConnections."]

  depends_on = [
    module.kv
  ]
}

data "azapi_resource" "sql_private_endpoint_connection" {
  type                   = "Microsoft.Sql/servers@2023-05-01-preview"
  resource_id            = module.sql[0].sql_server.id
  response_export_values = ["properties.privateEndpointConnections."]

  depends_on = [
    module.sql
  ]
}
locals {

  ## used https://github.com/hashicorp/terraform-provider-azurerm/issues/19777 for reference

  ## key vault
  key_vault_private_endpoint_connection_name = one([
    for connection in jsondecode(data.azapi_resource.key_vault_private_endpoint_connection.output).properties.privateEndpointConnections
    : connection.name if endswith(connection.properties.privateLinkServiceConnectionState.description, azurerm_data_factory_managed_private_endpoint.kv_adf_pe.name)
  ])

  ## SQL server endpoint
  sql_endpoint_connection_name = one([
    for connection in jsondecode(data.azapi_resource.sql_private_endpoint_connection.output).properties.privateEndpointConnections
    : connection.name if endswith(connection.properties.privateLinkServiceConnectionState.description, azurerm_data_factory_managed_private_endpoint.sql_adf_pe.adf_name)
  ])
}


## Do the actual approval for each of the connections
### key vault
resource "azapi_update_resource" "approve_kv_private_endpoint_connection" {
  type      = "Microsoft.KeyVault/vaults/privateEndpointConnections@2023-07-01"
  name      = local.key_vault_private_endpoint_connection_name
  parent_id = module.kv[0].resource_id

  body = jsonencode({
    properties = {
      privateLinkServiceConnectionState = {
        description = "Approved via Terraform - ${azurerm_data_factory_managed_private_endpoint.kv_adf_pe.name}" # To identify which managed private endpoint this connection belongs to we add the managed private endpoint name to the description
        status      = "Approved"
      }
    }
  })

  lifecycle {
    ignore_changes = all # We don't want to touch this after creation
  }
}

## SQL
resource "azapi_update_resource" "approve_sql_private_endpoint_connection" {
  type      = "Microsoft.Sql/servers/privateEndpointConnections@2023-05-01-preview"
  name      = local.sql_endpoint_connection_name
  parent_id = module.sql[0].sql_server.id

  body = jsonencode({
    properties = {
      privateLinkServiceConnectionState = {
        description = "Approved via Terraform - ${azurerm_data_factory_managed_private_endpoint.sql_adf_pe.name}" # To identify which managed private endpoint this connection belongs to we add the managed private endpoint name to the description
        status      = "Approved"
      }
    }
  })

  lifecycle {
    ignore_changes = all # We don't want to touch this after creation
  }
}
