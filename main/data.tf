data "azurerm_subnet" "subnet_gw_eu" {
  name                 = "AppGW-SBT-01"
  virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-001"
  resource_group_name  = var.eu_vars.resource_group.resource_group_location
}

data "azurerm_subnet" "subnet_gw_us" {
  name                 = "AppGW-SBT-01"
  virtual_network_name = "VN-ELX-EUS-Concent-NonProd-Spoke-001"
  resource_group_name  = var.us_vars.resource_group.resource_group_location
}

# data "azurerm_subnet" "subnet_apim_eu" {
#   name                 = "APIM-SBT-01"
#   virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-001"
#   resource_group_name  = var.eu_vars.resource_group.resource_group_location
# }

# data "azurerm_subnet" "subnet_apim_us" {
#   name                 = "APIM-SBT-01"
#   virtual_network_name = "VN-ELX-EUS-Concent-NonProd-Spoke-001"
#   resource_group_name  = var.us_vars.resource_group.resource_group_location
# }

data "azurerm_subnet" "subnet_aks_eu" {
  name                 = "AKS-SBT-01"
  virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-001"
  resource_group_name  = var.eu_vars.resource_group.resource_group_location
}

data "azurerm_subnet" "subnet_aks_us" {
  name                 = "AKS-SBT-01"
  virtual_network_name = "VN-ELX-EUS-Concent-NonProd-Spoke-001"
  resource_group_name  = var.us_vars.resource_group.resource_group_location
}