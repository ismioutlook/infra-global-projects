resource "azurerm_resource_group" "rg" {
  name     = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.arg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
}

resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = var.app_kind #"elastic"


  sku {
    tier = var.app_tier #"WorkflowStandard"
    size = var.app_size #"WS2"
  }
}

resource "azurerm_logic_app_standard" "logicapp" {
  name                       = var.logic_app_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"              = "node"
    "WEBSITE_NODE_DEFAULT_VERSION"          = "~18"
  }
}