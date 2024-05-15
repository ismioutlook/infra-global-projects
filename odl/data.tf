data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {
}


data "azurerm_key_vault_secret" "eventsub_delivery_secret" {
  count        = local.enabled_keyvault ? 1 : 0
  name         = local.eventsub_delivery_secret_key
  key_vault_id = module.kv[0].key_vault_id
}