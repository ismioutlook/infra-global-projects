tenant_id       = "d2007bef-127d-4591-97ac-10d72fe28031"
subscription_id = "f28071b5-e402-4c1a-83cc-ed0744ce8e0a"

# ------------------------Resource Group Module Details------------------------------
resource_group_location_eu = "West Europe"
resource_group_name_eu    = "RG-GL-ELX-EU-Sandbox"

resource_group_location_us = "East US"
resource_group_name_us     = "RG-GL-ELX-US-Sandbox"

resource_group_location_au = "Australia East"
resource_group_name_au     = "RG-GL-ELX-AU-Sandbox"

# ------------------------Virtual Network Module Details------------------------------
virtual_network_name_eu    = "VN-GL-ELX-EU-Sandbox"
virtual_network_name_us    = "VN-GL-ELX-US-Sandbox"
virtual_network_name_au   = "VN-GL-ELX-AU-Sandbox"

vnet_address_space_eu      = ["10.216.0.0/16"]
vnet_address_space_us      = ["10.217.0.0/16"]
vnet_address_space_au      = ["10.218.0.0/16"]

subnet_name            = ["Subnet-APIM", "Subnet-GW", "Subnet-AKS"]
subnet_address_space_eu    = ["10.216.3.0/24", "10.216.2.192/27", "10.216.2.0/25"]
subnet_address_space_us    = ["10.217.3.0/24", "10.217.2.192/27", "10.217.2.0/25"]
subnet_address_space_au    = ["10.218.3.0/24", "10.218.2.192/27", "10.218.2.0/25"]


service_endpoints       = ["Microsoft.Sql", "Microsoft.KeyVault"]