module "TM" {
  source                       = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-TM//module?ref=v0.0.2"
  tenant_id                    = var.tenant_id
  subscription_id              = var.subscription_id
  traffic_manager_name         = var.traffic_manager_name
  resource_group_name          = var.resource_group_name_eu
  traffic_routing_method       = var.traffic_routing_method
  ttl_value                    = var.ttl_value
  protocol                     = var.protocol
  port                         = var.port
  path                         = var.path
  interval_in_seconds          = var.interval_in_seconds
  timeout_in_seconds           = var.timeout_in_seconds
  tolerated_number_of_failures = var.tolerated_number_of_failures

  env_tag          = var.env_tag
  owner_tag        = var.owner_tag
  account_tag      = var.account_tag
  billingid_tag    = var.billingid_tag
  costcenterit_tag = var.costcenterit_tag
  sector_tag       = var.sector_tag
  created_by_tag   = var.created_by_tag
  depends_on       = [module.eu_gl_rg]
}
