# data "azurerm_subnet" "subnet_gw_eu" {
#   name                 = "AppGW-SBT-01"
#   virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-001"
#   resource_group_name  = "RG-ELX-GL-Concent-NonProd-Networking"
# }

# data "azurerm_subnet" "subnet_gw_us" {
#   name                 = "AppGW-SBT-01"
#   virtual_network_name = "VN-ELX-EUS-Concent-NonProd-Spoke-001"
#   resource_group_name  = "RG-ELX-EUS-Concent-NonProd-Networking"
# }

data "azurerm_subnet" "subnet_apim_eu" {
  name                 = "APIM-SBT-01"
  virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-001"
  resource_group_name  = "RG-ELX-GL-Concent-NonProd-Networking"
}

data "azurerm_subnet" "subnet_apim_us" {
  name                 = "APIM-SBT-01"
  virtual_network_name = "VN-ELX-EUS-Concent-NonProd-Spoke-001"
  resource_group_name  = "RG-ELX-EUS-Concent-NonProd-Networking"
}

# data "azurerm_subnet" "subnet_aks_eu" {
#   name                 = "AKS-SBT-01"
#   virtual_network_name = "VN-ELX-GL-Concent-NonProd-Spoke-001"
#   resource_group_name  = "RG-ELX-GL-Concent-NonProd-Networking"
# }

# data "azurerm_subnet" "subnet_aks_us" {
#   name                 = "AKS-SBT-01"
#   virtual_network_name = "VN-ELX-EUS-Concent-NonProd-Spoke-001"
#   resource_group_name  = "RG-ELX-EUS-Concent-NonProd-Networking"
# }

#  aks_subnet_id_eu   = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-001/subnets/AKS-SBT-01"
# aks_subnet_id_us = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-EUS-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-NonProd-Spoke-001/subnets/AKS-SBT-01"
    