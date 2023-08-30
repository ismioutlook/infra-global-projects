module "rg" {
  source              = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.3"
  resource_group_name = var.resource_group_name
}

module "gl_virtualNetwork" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-vnet//module?ref=v0.0.3"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  virtual_network_name    = var.virtual_network_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_space    = var.subnet_address_space
  service_endpoints       = var.service_endpoints
  depends_on              = [module.rg]
}