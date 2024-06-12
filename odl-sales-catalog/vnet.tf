resource "azurerm_subnet" "apps-sbnt" {
  count                = var.enabled && var.provision_subnet ? 1 : 0
  name                 = var.subnet_details.name
  resource_group_name  = var.subnet_details.resource_group_name
  virtual_network_name = var.subnet_details.vnet_name
  address_prefixes     = var.subnet_details.address_prefixes

  delegation {
    name = var.subnet_details.delegation.name
    service_delegation {
      name    = var.subnet_details.delegation.service_delegation.name
      actions = var.subnet_details.delegation.service_delegation.actions
    }
  }
}