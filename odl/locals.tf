locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "ODL"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id
  subscription_id = data.azurerm_subscription.current.subscription_id
  current_user_id = data.azurerm_client_config.current.object_id
  # 75f9a0c1-6e61-4cbe-beba-9ab39034b9a0 ---> CSA-AAD-PRJ-Concent-PE-Admin
  kv_admin_object_ids          = ["75f9a0c1-6e61-4cbe-beba-9ab39034b9a0", local.current_user_id]
  enabled_keyvault             = var.enabled && var.enabled_keyvault ? true : false
  enabled_apim_kv_access       = local.enabled_keyvault && var.kv_read_access_apim ? true : false
  sops_key_name                = format("odl-sopskey-%s", "${terraform.workspace}")
  eventsub_delivery_secret_key = "api-key"
  eventgrid_topics             = local.enabled_keyvault ? var.eventgrid_topics : {}
  apim_identities              = local.enabled_apim_kv_access ? data.azurerm_api_management.apim[0].identity : []
}
