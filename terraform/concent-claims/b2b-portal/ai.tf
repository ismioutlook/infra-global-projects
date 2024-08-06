module "app_insights" {
  count               = var.enabled ? 1 : 0
  source              = "Azure/avm-res-insights-component/azurerm"
  version             = "0.1.2"
  location            = module.rg[0].location
  application_type    = var.app_insights_type
  name                = var.app_insights_name
  resource_group_name = module.rg[0].name
  workspace_id        = module.law[0].log_analytics_workspace_id
  enable_telemetry    = var.enable_telemetry # see variables.tf
}