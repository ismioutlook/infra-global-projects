module "eu_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.eu_vars.virtual_network.resource_group_name_eu
  resource_group_location = var.eu_vars.virtual_network.resource_group_location_eu
  virtual_network_name    = var.eu_vars.virtual_network.virtual_network_name_eu
  vnet_address_space      = var.eu_vars.virtual_network.vnet_address_space_eu
  subnet_name             = var.eu_vars.virtual_network.subnet_name
  subnet_address_space    = var.eu_vars.virtual_network.subnet_address_space_eu
  service_endpoints       = var.eu_vars.virtual_network.service_endpoints
  depends_on              = [module.eu_gl_rg]
}

module "us_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.us_vars.virtual_network.resource_group_name_us
  resource_group_location = var.us_vars.virtual_network.resource_group_location_us
  virtual_network_name    = var.us_vars.virtual_network.virtual_network_name_us
  vnet_address_space      = var.us_vars.virtual_network.vnet_address_space_us
  subnet_name             = var.us_vars.virtual_network.subnet_name
  subnet_address_space    = var.us_vars.virtual_network.subnet_address_space_us
  service_endpoints       = var.us_vars.virtual_network.service_endpoints
  depends_on              = [module.us_gl_rg]
}

module "us2_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.us2_vars.virtual_network.resource_group_name_us2
  resource_group_location = var.us2_vars.virtual_network.resource_group_location_us2
  virtual_network_name    = var.us2_vars.virtual_network.virtual_network_name_us2
  vnet_address_space      = var.us2_vars.virtual_network.vnet_address_space_us2
  subnet_name             = var.us2_vars.virtual_network.subnet_name
  subnet_address_space    = var.us2_vars.virtual_network.subnet_address_space_us2
  service_endpoints       = var.us2_vars.virtual_network.service_endpoints
  depends_on              = [module.us2_gl_rg]
}