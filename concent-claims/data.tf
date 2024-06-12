data "azurerm_subscription" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "sa" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

data "azurerm_application_insights" "appinsight" {
  name                = var.app_insights_name
  resource_group_name = var.resource_group_name
}