module "kv" {
  count                         = var.enabled ? 1 : 0
  source                        = "Azure/avm-res-keyvault-vault/azurerm"
  version                       = "v0.7.1"
  name                          = var.key_vault_name
  enable_telemetry              = var.enable_telemetry
  location                      = module.rg[0].location
  resource_group_name           = module.rg[0].name
  tenant_id                     = local.tenant_id
  sku_name                      = var.kv_sku_name
  soft_delete_retention_days    = var.soft_delete_retention_days
  public_network_access_enabled = false
  role_assignments              = merge(var.kv_role_assignments, local.kv_adf_roleassignment)
  secrets = {
    sql_server_username = {
      name = "sql-srv-username"
    },
    sql_server_password = {
      name = "sql-srv-password"
    }
  }
  secrets_value = {
    sql_server_username = "c4creplicaadmin"
    sql_server_password = random_string.db_password.result
  }
  depends_on = [module.adf]
}