module "isp-sb-eh" {
  count                       = var.enabled ? 1 : 0
  source                      = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-eh//module?ref=v1.0.0"
  tenant_id                   = var.tenant_id
  subscription_id             = var.subscription_id
  eventhub_namespace_name     = var.eventhub_namespace_name
  eventhub_names              = var.eventhub_names
  resource_group_location     = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  sku                         = var.sku
  partition_count             = var.partition_count
  eventhub_namespace_capacity = var.eventhub_namespace_capacity
  auto_inflate_enabled        = var.auto_inflate_enabled
  maximum_throughput_units    = var.maximum_throughput_units
  message_retention           = var.message_retention
  # Tags
  owner_tag        = var.tags.owner_tag
  account_tag      = var.tags.account_tag
  billingid_tag    = var.tags.billingid_tag
  costcenterit_tag = var.tags.costcenterit_tag
  sector_tag       = var.tags.sector_tag
  env_tag          = var.tags.env_tag
  created_by_tag   = var.tags.created_by_tag

}