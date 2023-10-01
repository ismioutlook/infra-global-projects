module "TM" {
  source                       = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-TM//module?ref=v0.0.2"
  tenant_id                    = var.subscription.nonprod.tenant_id
  subscription_id              = var.subscription.nonprod.subscription_id
  resource_group_name          = var.eu_vars.resource_group.resource_group_name
  traffic_manager_name         = var.eu_vars.traffic_manager.traffic_manager_name
  traffic_routing_method       = var.eu_vars.traffic_manager.traffic_routing_method
  ttl_value                    = var.eu_vars.traffic_manager.ttl_value
  protocol                     = var.eu_vars.traffic_manager.protocol
  port                         = var.eu_vars.traffic_manager.port
  path                         = var.eu_vars.traffic_manager.path
  interval_in_seconds          = var.eu_vars.traffic_manager.interval_in_seconds
  timeout_in_seconds           = var.eu_vars.traffic_manager.timeout_in_seconds
  tolerated_number_of_failures = var.eu_vars.traffic_manager.tolerated_number_of_failures

  env_tag          = var.eu_vars.tags.env_tag
  owner_tag        = var.eu_vars.tags.owner_tag
  account_tag      = var.eu_vars.tags.account_tag
  billingid_tag    = var.eu_vars.tags.billingid_tag
  costcenterit_tag = var.eu_vars.tags.costcenterit_tag
  sector_tag       = var.eu_vars.tags.sector_tag
  created_by_tag   = var.eu_vars.tags.created_by_tag
  depends_on       = [module.eu_gl_rg]
}
