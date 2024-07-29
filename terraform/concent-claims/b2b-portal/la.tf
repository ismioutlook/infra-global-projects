module "law" {
  count                                     = var.enabled ? 1 : 0
  source                                    = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-law//module?ref=v0.0.5"
  resource_group_location                   = module.rg[0].location
  tenant_id                                 = local.tenant_id
  subscription_id                           = local.subscription_id
  resource_group_name                       = module.rg[0].name
  log_analytics_workspace_name              = var.log_analytics_workspace_name
  log_analytics_workspace_sku               = var.log_analytics_workspace_sku
  log_analytics_workspace_retention_in_days = var.log_analytics_workspace_retention_in_days
}