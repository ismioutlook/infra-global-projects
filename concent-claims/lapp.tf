resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg[0].location
  resource_group_name = azurerm_resource_group.rg[0].name
  kind                = var.app_kind #"elastic"


  sku {
    tier = var.app_tier #"WorkflowStandard"
    size = var.app_size #"WS2"
  }
}

resource "azurerm_logic_app_standard" "logicapp" {
  count                      = var.enabled ? 1 : 0
  name                       = var.logic_app_name
  location                   = azurerm_resource_group.rg[0].location
  resource_group_name        = azurerm_resource_group.rg[0].name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = data.azurerm_storage_account.sa.name
  storage_account_access_key = data.azurerm_storage_account.sa.primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"              = "node"
    "WEBSITE_NODE_DEFAULT_VERSION"          = "~16"
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = data.azurerm_application_insights.appinsight.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = data.azurerm_application_insights.appinsight.connection_string
  }

  identity {
    type = "SystemAssigned"
  }
}