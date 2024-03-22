module "law" {
  source                                    = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-law//module?ref=v0.0.2"
  resource_group_location                   = var.resource_group_location
  tenant_id                                 = var.tenant_id
  subscription_id                           = var.subscription_id
  resource_group_name                       = var.resource_group_name
  log_analytics_workspace_name              = var.log_analytics_workspace_name
  log_analytics_workspace_sku               = var.log_analytics_workspace_sku
  log_analytics_workspace_retention_in_days = var.log_analytics_workspace_retention_in_days
}