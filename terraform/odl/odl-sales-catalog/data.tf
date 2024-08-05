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

data "azurerm_key_vault_secret" "eventsub_delivery_secret" {
  count        = var.enabled && length(var.eventgrid_topics) > 0 ? 1 : 0
  name         = local.sales_catalog_app_services_api_key_secret
  key_vault_id = var.keyvault_id
}
