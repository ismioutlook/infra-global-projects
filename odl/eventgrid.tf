module "eventgrid_topics" {
  for_each                = local.eventgrid_topics
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-eventgrid//iasc?ref=v0.0.6"
  tenant_id               = local.tenant_id
  subscription_id         = local.subscription_id
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location

  eventgrid_custom_topic_name    = each.value.eventgrid_custom_topic_name
  eventgrid_custom_subscriptions = each.value.eventgrid_custom_subscriptions

  header_name     = local.eventsub_delivery_secret_key
  header_type     = "Static"
  header_value    = data.azurerm_key_vault_secret.eventsub_delivery_secret[0].value
  header_issecret = true
}
