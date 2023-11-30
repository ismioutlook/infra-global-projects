data "azurerm_subnet" "subnet_apim" {
  name                 = "APIM-SBNT-001"
  resource_group_name  = "RG-ELX-GL-Concent-NonProd-Networking"
  virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-002"
}

data "azurerm_subnet" "subnet_appgw" {
  name                 = "APPGW-SBNT-001"
  resource_group_name  = "RG-ELX-GL-Concent-NonProd-Networking"
  virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-002"
}

data "azurerm_subnet" "subnet_aks" {
  name                 = "AKS-SBNT-001"
  resource_group_name  = "RG-ELX-GL-Concent-NonProd-Networking"
  virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-002"
}

data "azurerm_subnet" "subnet_pv_endpoints" {
  name                 = "PV-ENDPOINTS-SBNT-001"
  resource_group_name  = "RG-ELX-GL-Concent-NonProd-Networking"
  virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-002"
}