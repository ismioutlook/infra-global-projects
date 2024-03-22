module "app_insights" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-appinsights//module?ref=v0.0.2"
  resource_group_location = var.resource_group_location
  tenant_id               = var.tenant_id
  subscription_id         = var.subscription_id
  resource_group_name     = var.resource_group_name
  app_insights_type       = var.app_insights_type
  app_insights_name       = var.app_insights_name
  workspace_id            = module.law.workspace_id
}