module "eu_gl_rg" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.4"
  resource_group_name     = var.resource_group_name_eu
  resource_group_location = var.resource_group_location_eu
}

module "us_gl_rg" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.4"
  resource_group_name     = var.resource_group_name_us
  resource_group_location = var.resource_group_location_us
}

module "us2_gl_rg" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.4"
  resource_group_name     = var.resource_group_name_us2
  resource_group_location = var.resource_group_location_us2
}