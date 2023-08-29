tenant_id       = "d2007bef-127d-4591-97ac-10d72fe28031"
subscription_id = "f28071b5-e402-4c1a-83cc-ed0744ce8e0a"

virtual_network_name    = "VN-GL-ELX-EU-Sandbox"
vnet_address_space      = ["10.216.0.0/16"]
subnet_name             = ["Subnet-APIM", "Subnet-GW", "Subnet-Mgmt", "Subnet-Frontend", "Subnet-Backend"]
subnet_address_space    = ["10.216.3.0/24", "10.216.2.192/27", "10.216.2.0/25", "10.216.4.0/24", "10.216.5.0/24"]
resource_group_location = "West Europe"
resource_group_name     = "RG-GL-ELX-EU-Sandbox"
service_endpoints       = ["Microsoft.Sql", "Microsoft.KeyVault"]