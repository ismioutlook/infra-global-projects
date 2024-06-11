resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  kind                = var.app_kind #"elastic"


  sku {
    tier = var.app_tier #"WorkflowStandard"
    size = var.app_size #"WS2"
  }
}

resource "azurerm_logic_app_standard" "logicapp" {
  name                       = var.logic_app_name
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_name.primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"              = "node"
    "WEBSITE_NODE_DEFAULT_VERSION"          = "~16"
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = var.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = var.connection_string
  }

  identity {
    type = "SystemAssigned"
  }
}