module "eu_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.eu_vars.resource_group.resource_group_name
  resource_group_location = var.eu_vars.resource_group.resource_group_location
  virtual_network_name    = var.eu_vars.virtual_network.virtual_network_name
  vnet_address_space      = var.eu_vars.virtual_network.vnet_address_space
  subnet_name             = var.eu_vars.virtual_network.subnet_name
  subnet_address_space    = var.eu_vars.virtual_network.subnet_address_space
  service_endpoints       = var.eu_vars.virtual_network.service_endpoints
  depends_on              = [module.eu_gl_rg]
}

module "us_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.us_vars.resource_group.resource_group_name
  resource_group_location = var.us_vars.resource_group.resource_group_location
  virtual_network_name    = var.us_vars.virtual_network.virtual_network_name
  vnet_address_space      = var.us_vars.virtual_network.vnet_address_space
  subnet_name             = var.us_vars.virtual_network.subnet_name
  subnet_address_space    = var.us_vars.virtual_network.subnet_address_space
  service_endpoints       = var.us_vars.virtual_network.service_endpoints
  depends_on              = [module.us_gl_rg]
}

module "us2_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.us2_vars.resource_group.resource_group_name
  resource_group_location = var.us2_vars.resource_group.resource_group_location
  virtual_network_name    = var.us2_vars.virtual_network.virtual_network_name
  vnet_address_space      = var.us2_vars.virtual_network.vnet_address_space
  subnet_name             = var.us2_vars.virtual_network.subnet_name
  subnet_address_space    = var.us2_vars.virtual_network.subnet_address_space
  service_endpoints       = var.us2_vars.virtual_network.service_endpoints
  depends_on              = [module.us2_gl_rg]
}