data "azurerm_subnet" "subnet_apim" {
  name                 = "APIM-SBNT-001"
  resource_group_name  = var.eu_vars.virtual_network.vnet_resource_group_name
  virtual_network_name = var.eu_vars.virtual_network.virtual_network_name
}

data "azurerm_subnet" "subnet_appgw" {
  name                 = "APPGW-SBNT-001"
  resource_group_name  = var.eu_vars.virtual_network.vnet_resource_group_name
  virtual_network_name = var.eu_vars.virtual_network.virtual_network_name
}

data "azurerm_subnet" "subnet_aks" {
  name                 = "AKS-SBNT-001"
  resource_group_name  = var.eu_vars.virtual_network.vnet_resource_group_name
  virtual_network_name = var.eu_vars.virtual_network.virtual_network_name
}

data "azurerm_subnet" "subnet_pv_endpoints" {
  name                 = "PV-ENDPOINTS-SBNT-001"
  resource_group_name  = var.eu_vars.virtual_network.vnet_resource_group_name
  virtual_network_name = var.eu_vars.virtual_network.virtual_network_name
}