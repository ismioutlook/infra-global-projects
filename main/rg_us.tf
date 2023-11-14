module "us_gl_rg" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.4"
  resource_group_name     = var.us_vars.resource_group.resource_group_name
  resource_group_location = var.us_vars.resource_group.resource_group_location
}