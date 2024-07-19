module "app_insights" {
  count                   = var.enabled ? 1 : 0
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-appinsights//module?ref=v0.0.3"
  resource_group_location = azurerm_resource_group.rg[0].location
  tenant_id               = local.tenant_id
  subscription_id         = local.subscription_id
  resource_group_name     = azurerm_resource_group.rg[0].name
  app_insights_type       = var.app_insights_type
  app_insights_name       = var.app_insights_name
  workspace_id            = module.law[0].workspace_id
}