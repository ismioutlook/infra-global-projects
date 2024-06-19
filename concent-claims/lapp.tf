resource "azurerm_service_plan" "asp" {
  count               = var.enabled && var.enabled_logicapp ? 1 : 0
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.rg[0].name
  location            = azurerm_resource_group.rg[0].location
  os_type             = var.app_service_plan_name_os_type
  sku_name            = var.app_service_plan_name_sku_name
}
resource "azurerm_logic_app_standard" "logicapp" {
  count                      = var.enabled && var.enabled_logicapp ? 1 : 0
  name                       = var.logic_app_name
  location                   = azurerm_resource_group.rg[0].location
  resource_group_name        = azurerm_resource_group.rg[0].name
  app_service_plan_id        = azurerm_service_plan.asp[0].id
  storage_account_name       = data.azurerm_storage_account.sa.name
  storage_account_access_key = data.azurerm_storage_account.sa.primary_access_key
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = "node"
    "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
    "VERSION"                      = "~4"
  }
}