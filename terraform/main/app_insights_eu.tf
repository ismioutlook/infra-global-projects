# module "eu_gl_appinsights" {
#   source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-appinsights//module?ref=v0.0.2"
#   resource_group_name     = var.eu_vars.resource_group.resource_group_name
#   resource_group_location = var.eu_vars.resource_group.resource_group_location
#   app_insights_name       = var.eu_vars.application_insights.app_insights_name
#   app_insights_type       = var.eu_vars.application_insights.app_insights_type
#   workspace_id            = module.
# }