resource "azurerm_subnet" "sc-ingestion-sbnt" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_cidrs

  delegation {
    name = var.subnet_delegation_name
    service_delegation {
      name    = var.service_delegation_name
      actions = var.service_delegation_actions
    }
  }
}