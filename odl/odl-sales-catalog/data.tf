data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {
}

data "azuread_group" "ad_groups" {
  for_each     = toset(local.principal_group_names)
  display_name = each.value
}

data "azurerm_subnet" "subnet" {
  count                = var.function_app_subnet_details != null ? 1 : 0
  name                 = var.function_app_subnet_details.subnet_name
  virtual_network_name = var.function_app_subnet_details.vnet_name
  resource_group_name  = var.function_app_subnet_details.resource_group_name
}