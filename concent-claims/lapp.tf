terraform {
      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "3.3.0"
        }
      }
    }

resource "azurerm_storage_account" "sa" {
  count                    = var.enabled ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg[0].name
  location                 = azurerm_resource_group.rg[0].location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
}

resource "azurerm_app_service_plan" "asp" {
  count               = var.enabled ? 1 : 0
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
  app_service_plan_id        = azurerm_app_service_plan.asp[0].id
  storage_account_name       = azurerm_storage_account.sa[0].name
  storage_account_access_key = azurerm_storage_account.sa[0].primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = "node"
    "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
  }

}