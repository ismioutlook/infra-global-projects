module "fsm-np-eh" {
  source                      = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-eh//module?ref=v0.0.9"
  tenant_id                   = var.tenant_id
  subscription_id             = var.subscription_id
  eventhub_namespace_name     = var.eventhub_namespace_name
  eventhub_names              = var.eventhub_names
  consumer_group_names        = var.consumer_group_names
  resource_group_location     = var.resource_group_location
  resource_group_name         = var.resource_group_name
  sku                         = var.sku
  partition_count             = var.partition_count
  eventhub_namespace_capacity = var.eventhub_namespace_capacity
  auto_inflate_enabled        = var.auto_inflate_enabled
  maximum_throughput_units    = var.maximum_throughput_units
  message_retention           = var.message_retention
  subnet_name                 = var.subnet_name
  vnet_name                   = var.vnet_name
  vnet_rg_name                = var.vnet_rg_name
  owner_tag                   = var.owner_tag
  account_tag                 = var.account_tag
  billingid_tag               = var.billingid_tag
  costcenterit_tag            = var.costcenterit_tag
  sector_tag                  = var.sector_tag
  env_tag                     = var.env_tag
  created_by_tag              = var.created_by_tag
  #depends_on                  = [ module.fsm-np-rg ]
}

moved {
  from = module.fsm-np-eh.azurerm_eventhub.eventhub[5]
  to   = module.fsm-np-eh.azurerm_eventhub.eventhub[4]
}

moved {
  from = module.fsm-np-eh.azurerm_eventhub_consumer_group.consumer_group[5]
  to   = module.fsm-np-eh.azurerm_eventhub_consumer_group.consumer_group[4]
}