data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {
}

data "azuread_group" "rg_reader" {
  for_each     = toset(var.resource_group_readers)
  display_name = each.value
}

data "azurerm_api_management" "apim" {
  count               = local.enabled_apim_kv_access ? 1 : 0
  name                = var.apim_details.name
  resource_group_name = var.apim_details.resource_group
}

data "azurerm_key_vault_secret" "eventsub_delivery_secret" {
  count        = local.enabled_keyvault ? 1 : 0
  name         = local.eventsub_delivery_secret_key
  key_vault_id = module.kv[0].key_vault_id
}