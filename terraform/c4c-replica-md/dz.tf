module "dz" {
  count                 = var.enabled ? 1 : 0
  source                = "Azure/avm-res-network-privatednszone/azurerm"
  version               = "v0.1.2"
  enable_telemetry      = var.enable_telemetry
  resource_group_name   = module.rg[0].name
  domain_name           = "c4creplica.azure.net"
  tags                  = {}
  virtual_network_links = var.virtual_network_links

}