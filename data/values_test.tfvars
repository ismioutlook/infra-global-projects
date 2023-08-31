tenant_id       = "d2007bef-127d-4591-97ac-10d72fe28031"
subscription_id = "f28071b5-e402-4c1a-83cc-ed0744ce8e0a"

# ------------------------Resource Group Module Details for EU region------------------------------
resource_group_location_eu = "West Europe"
resource_group_name_eu     = "RG-GL-ELX-EU-Sandbox1"
virtual_network_name_eu = "VN-GL-ELX-EU-Sandbox1"
vnet_address_space_eu = ["10.216.0.0/16"]
subnet_address_space_eu = ["10.216.3.0/24", "10.216.2.192/27", "10.216.2.0/25"]
#----------------------------Resource Group Module Details for US region ------------------------------
resource_group_location_us = "East US"
resource_group_name_us     = "RG-GL-ELX-US-Sandbox1"
virtual_network_name_us = "VN-GL-ELX-US-Sandbox1"
vnet_address_space_us = ["10.217.0.0/16"]
subnet_address_space_us = ["10.217.3.0/24", "10.217.2.192/27", "10.217.2.0/25"]
# ------------------------Resource Group Module Details for AS region------------------------------

resource_group_location_au = "North Central US"
resource_group_name_au     = "RG-GL-ELX-AU-Sandbox1"
virtual_network_name_au = "VN-GL-ELX-AU-Sandbox1"
vnet_address_space_au = ["10.218.0.0/16"]
subnet_address_space_au = ["10.218.3.0/24", "10.218.2.192/27", "10.218.2.0/25"]
#------------------------------------------------------------------------------------------
subnet_name             = ["Subnet-APIM", "Subnet-GW", "Subnet-AKS"]
service_endpoints = ["Microsoft.Sql", "Microsoft.KeyVault"]

#----------------------------------Traffic Manager-----------------------------------------
traffic_manager_name         = "tmglobalpocsandbox01"
traffic_routing_method       = "Performance"
ttl_value                    = 60
protocol                     = "HTTPS"
port                         = 443
path                         = "/"
interval_in_seconds          = 30
timeout_in_seconds           = 10
tolerated_number_of_failures = 3

#---------------------------Tags--------------------------------------------------
env_tag          = "Sandbox"
owner_tag        = "Arun Nalliannan"
account_tag      = "623065"
billingid_tag    = "POC"
costcenterit_tag = "10350645"
sector_tag       = "Europe"
created_by_tag   = "PETeam"