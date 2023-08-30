module "eu_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.resource_group_name_eu
  resource_group_location = var.resource_group_location_eu
  virtual_network_name    = var.virtual_network_name_eu
  vnet_address_space      = var.vnet_address_space_eu
  subnet_name             = var.subnet_name
  subnet_address_space    = var.subnet_address_space_eu
  service_endpoints       = var.service_endpoints
  depends_on              = [module.eu_gl_rg]
}

module "us_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.resource_group_name_us
  resource_group_location = var.resource_group_location_us
  virtual_network_name    = var.virtual_network_name_us
  vnet_address_space      = var.vnet_address_space_us
  subnet_name             = var.subnet_name
  subnet_address_space    = var.subnet_address_space_us
  service_endpoints       = var.service_endpoints
  depends_on              = [module.us_gl_rg]
}

module "au_gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.resource_group_name_au
  resource_group_location = var.resource_group_location_au
  virtual_network_name    = var.virtual_network_name_au
  vnet_address_space      = var.vnet_address_space_au
  subnet_name             = var.subnet_name
  subnet_address_space    = var.subnet_address_space_au
  service_endpoints       = var.service_endpoints
  depends_on              = [module.au_gl_rg]
}