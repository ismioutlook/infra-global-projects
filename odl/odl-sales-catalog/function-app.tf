resource "azurerm_service_plan" "serviceplan" {
  count               = var.enabled ? 1 : 0
  name                = var.function_app_plan.name
  resource_group_name = azurerm_resource_group.rg[0].name
  location            = azurerm_resource_group.rg[0].location
  os_type             = "Linux"
  sku_name            = var.function_app_plan.sku_name
  tags                = local.tags
}

resource "azurerm_application_insights" "sales-catalog-rex-appin" {
  count               = var.enabled && var.enabled_application_insights ? 1 : 0
  name                = var.application_insights_name
  resource_group_name = azurerm_resource_group.rg[0].name
  location            = azurerm_resource_group.rg[0].location
  application_type    = var.application_insights_type
}

resource "azurerm_role_assignment" "app_insights_role_assign" {
  for_each = { for item in local.app_insights_flat_role_assign_map : "${item.role}-${item.group}" => item }

  principal_id         = data.azuread_group.ad_groups[each.value.group].object_id
  scope                = azurerm_application_insights.sales-catalog-rex-appin[0].id
  role_definition_name = each.value.role
  principal_type       = "Group"
}

resource "azurerm_linux_function_app" "sales-catalog-ingestion-fap" {
  count                       = var.enabled ? 1 : 0
  name                        = var.function_app_name
  resource_group_name         = azurerm_resource_group.rg[0].name
  location                    = azurerm_resource_group.rg[0].location
  service_plan_id             = azurerm_service_plan.serviceplan[0].id
  storage_account_name        = local.storage_account_name
  storage_account_access_key  = azurerm_storage_account.sales-catalog-ingestion[count.index].primary_access_key
  virtual_network_subnet_id   = local.virtual_network_subnet_id
  tags                        = local.tags
  functions_extension_version = "~4"

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_insights_connection_string = one(azurerm_application_insights.sales-catalog-rex-appin[*].connection_string)
    application_insights_key               = one(azurerm_application_insights.sales-catalog-rex-appin[*].instrumentation_key)
    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"       = "python",
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = true,
    "sc_rex_upload_conn_str"         = azurerm_storage_account.sales-catalog-rex-upload[count.index].primary_connection_string
    "sc_rex_upload_cont_name"        = var.storage_container_name_rex
    "kv_uri"                         = "https://${var.key_vault_name}.vault.azure.net"
    "kv_secret_name"                 = var.key_vault_secret_name
  }
}