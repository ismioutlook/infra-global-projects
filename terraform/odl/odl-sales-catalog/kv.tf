module "kv" {
  count                      = local.enabled_keyvault ? 1 : 0
  source                     = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-keyvault//module?ref=featue/rotationpolicy-addon"
  tenant_id                  = local.tenant_id
  resource_group_name        = var.resource_group_name
  resource_group_location    = var.resource_group_location
  key_vault_name             = var.key_vault_name
  soft_delete_retention_days = var.soft_delete_retention_days
  kv_sku_name                = var.kv_sku_name
  admin_objects_ids          = local.kv_admin_object_ids
}

resource "azurerm_key_vault_secret" "eventgrid_topic_key" {
  for_each     = local.eventgrid_topics
  name         = format("%s-key1", each.value.eventgrid_custom_topic_name)
  value        = azurerm_eventgrid_topic.eventgrid_topic[each.key].primary_access_key
  key_vault_id = var.keyvault_id
}
