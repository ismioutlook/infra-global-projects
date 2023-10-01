subscription = {
  nonprod = {
    tenant_id       = "d2007bef-127d-4591-97ac-10d72fe28031"
    subscription_id = "4731e47d-991b-4fbd-86aa-1e861607b82f"
  }
}

eu_vars = {
  resource_group = {
    resource_group_location  = "West Europe"
    resource_group_name      = "RG-GL-ELX-EU-NonProd"
  }
  virtual_network = {
    virtual_network_name     = "VN-GL-ELX-EU-NonProd"
    vnet_address_space       = ["10.216.0.0/16"]
    subnet_address_space  = ["10.216.3.0/24", "10.216.2.192/27", "10.216.2.0/25", "10.216.4.0/25"]
    service_endpoints = ["Microsoft.Sql", "Microsoft.KeyVault"]
    subnet_name       = ["Subnet-APIM", "Subnet-GW", "Subnet-AKS", "Subnet-fe"]
  }
  app_gateway = {
    appgw_pip_name_eu         = "AAG-GL-ELX-EU-NonProd-PIP"
    appgw_pip_allocation   = "Static"
    appgw_name             = "AppGw-GL-ELX-EU-NonProd"
    appgw_sku_name         = "WAF_v2"
    appgw_sku_tier         = "WAF_v2"
    appgw_sku_capacity     = 2
    appgw_ip_config_name   = "AppGw-GL-ELX-EU-IP-Config"
    subnet_id              = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-EU-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-EU-NonProd/subnets/Subnet-GW"
    ssl_certificate_name      = "nonprod-electrolux-com"
    key_vault_secret_id       = "https://elxkv-cert-nonprod-gl-01.vault.azure.net/secrets/nonprod-electrolux-com"
    hostname                  = "nonprod.electrolux.com"
    apim_address_pool      = ["10.216.3.6"]
    user_managed_identity  = "id-appgw-gl-westeu"
  }
  traffic_manager = {
    traffic_manager_name         = "tmelxglobalnonprod01"
    traffic_routing_method       = "Performance"
    ttl_value                    = 60
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }
  api_management = {
    apim_subnet_id_eu         = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-EU-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-EU-NonProd/subnets/Subnet-APIM"
    apim_subnet_id_us         = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US-NonProd/subnets/Subnet-APIM"
    apim_subnet_id_us2        = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US2-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US2-NonProd/subnets/Subnet-APIM"
    apim_name                 = "elxapimglnonprod"
    apim_publisher_name       = "Electrolux"
    apim_publisher_email      = "chirag.panchal@electrolux.com"
    apim_sku_name             = "Premium_1"
    gateway_hostname          = "api-nonprod.electrolux.com"
    developer_portal_hostname = "portal-nonprod.electrolux.com"
    management_hostname       = "management-nonprod.electrolux.com"
    scm_hostname              = "scm-nonprod.electrolux.com"
  }
  tags = {
    env_tag          = "NonProd"
    owner_tag        = "Arun Nalliannan"
    account_tag      = "623065"
    billingid_tag    = "Global"
    costcenterit_tag = "10350645"
    sector_tag       = "WestEurope"
    created_by_tag   = "PETeam(PanchChi)"
  }
}

#---------------------------------------------------US Vars group-------------------------------------------------------------------
us_vars = {
  resource_group = {
    resource_group_location  = "East US"
    resource_group_name     = "RG-GL-ELX-US-NonProd"
  }
  virtual_network = {
    virtual_network_name     = "VN-GL-ELX-US-NonProd"
    vnet_address_space       = ["10.217.0.0/16"]
    subnet_address_space    = ["10.217.3.0/24", "10.217.2.192/27", "10.217.2.0/25", "10.217.4.0/25"]
    service_endpoints = ["Microsoft.Sql", "Microsoft.KeyVault"]
    subnet_name       = ["Subnet-APIM", "Subnet-GW", "Subnet-AKS", "Subnet-fe"]
  }
  app_gateway = {
    appgw_pip_name       = "AAG-GL-ELX-US-NonProd-PIP"
    appgw_pip_allocation = "Static"
    appgw_name           = "AppGw-GL-ELX-US-NonProd"
    appgw_sku_name      = "WAF_v2"
    appgw_sku_tier       = "WAF_v2"
    appgw_sku_capacity   = 2
    appgw_ip_config_name = "AppGw-GL-ELX-US-IP-Config"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US-NonProd/subnets/Subnet-GW"
    user_managed_identity  = "id-appgw-gl-us"
    apim_address_pool = ["10.217.3.6"]
  }
  tags = {
    env_tag          = "NonProd"
    owner_tag        = "Arun Nalliannan"
    account_tag      = "623065"
    billingid_tag    = "Global"
    costcenterit_tag = "10350645"
    sector_tag       = "East US"
    created_by_tag   = "PETeam(PanchChi)"
  }
}

#---------------------------------------------US2 Vars Group --------------------------------------------------
us2_vars = {
  resource_group = {
    resource_group_location  = "East US 2"
    resource_group_name      = "RG-GL-ELX-US2-NonProd"
  }
  virtual_network = {
    virtual_network_name    = "VN-GL-ELX-US2-NonProd"
    vnet_address_space     = ["10.218.0.0/16"]
    subnet_address_space     = ["10.218.3.0/24", "10.218.2.192/27", "10.218.2.0/25", "10.218.4.0/25"]
    service_endpoints = ["Microsoft.Sql", "Microsoft.KeyVault"]
    subnet_name       = ["Subnet-APIM", "Subnet-GW", "Subnet-AKS", "Subnet-fe"]
  }
  app_gateway = {
    appgw_pip_name       = "AAG-GL-ELX-US2-NonProd-PIP1"
    appgw_pip_allocation = "Static"
    appgw_name           = "AppGw-GL-ELX-US2-NonProd"
    appgw_sku_name       = "WAF_v2"
    appgw_sku_tier       = "WAF_v2"
    appgw_sku_capacity   = 2
    appgw_ip_config_name = "AppGw-GL-ELX-US2-IP-Config"
    subnet_id            = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US2-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US2-NonProd/subnets/Subnet-GW"
    user_managed_identity  = "id-appgw-gl-us2"
    apim_address_pool = ["10.218.3.6"]
  }
  tags = {
    env_tag          = "NonProd"
    owner_tag        = "Arun Nalliannan"
    account_tag      = "623065"
    billingid_tag    = "Global"
    costcenterit_tag = "10350645"
    sector_tag       = "East US"
    created_by_tag   = "PETeam(PanchChi)"
  }
}

aks_vars = {
  azure_k8s_service = {
    log_analytics_name    = "LA-GL-ELX-AKS-WS-NonProd"
    la_sku                = "PerGB2018"
    la_solution_name      = "ContainerInsights"
    cluster_name          = "AKS-Global-EU-NonProd"
    kubernetes_version    = "1.26.6"
    pod_security_policy   = false
    node_count            = 2
    node_vm_size          = "Standard_D2s_v3"
    os_disk_size_gb       = 80
    enable_auto_scaling   = true
    node_min_count        = 1
    node_max_count        = 5
    node_max_pods         = 60
    node_taints           = []
    node_labels = {
      "service" = "kubernetes"
      "env"     = "nonprod"
      "project" = "myproject"
    }
    node_resource_group_name_eu = "RG-GL-ELX-EU-AKS-Node-Cluster-NonProd"
    node_resource_group_name_us = "RG-GL-ELX-US-AKS-Node-Cluster-NonProd"
    node_resource_group_name_us2= "RG-GL-ELX-US2-AKS-Node-Cluster-NonProd"
    # Network profile
    aks_subnet_id_eu   = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-EU-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-EU-NonProd/subnets/Subnet-AKS"
    aks_subnet_id_us = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US-NonProd/subnets/Subnet-AKS"
    aks_subnet_id_us2 = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US2-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US2-NonProd/subnets/Subnet-AKS"
    network_plugin     = "azure"
    network_policy     = "azure"
    pod_cidr           = "10.0.16.0/20"
    service_cidr       = "10.0.32.0/20"
    dns_service_ip     = "10.0.32.10"
    docker_bridge_cidr = "172.0.0.1/8"
  }
}

# # ------------------------Resource Group Module Details for EU region------------------------------
# resource_group_location_eu  = "West Europe"
# resource_group_name_eu      = "RG-GL-ELX-EU-NonProd"
# node_resource_group_name_eu = "RG-GL-ELX-EU-AKS-Node-Cluster-NonProd"
# virtual_network_name_eu     = "VN-GL-ELX-EU-NonProd"
# vnet_address_space_eu       = ["10.216.0.0/16"]
# subnet_address_space_eu     = ["10.216.3.0/24", "10.216.2.192/27", "10.216.2.0/25", "10.216.4.0/25"]

# appgw_pip_name_eu         = "AAG-GL-ELX-EU-NonProd-PIP"
# appgw_pip_allocation_eu   = "Static"
# appgw_name_eu             = "AppGw-GL-ELX-EU-NonProd"
# appgw_sku_name_eu         = "WAF_v2"
# appgw_sku_tier_eu         = "WAF_v2"
# appgw_sku_capacity_eu     = 2
# appgw_ip_config_name_eu   = "AppGw-GL-ELX-EU-IP-Config"
# subnet_id_eu              = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-EU-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-EU-NonProd/subnets/Subnet-GW"
# ssl_certificate_name      = "nonprod-electrolux-com"
# key_vault_secret_id       = "https://elxkv-cert-nonprod-gl-01.vault.azure.net/secrets/nonprod-electrolux-com"
# hostname                  = "nonprod.electrolux.com"
# apim_address_pool_eu      = ["10.216.3.6"]
# apim_address_pool_us      = ["10.217.3.6"]
# apim_address_pool_us2     = ["10.218.3.6"]
# user_managed_identity_eu  = "id-appgw-gl-westeu"
# user_managed_identity_us  = "id-appgw-gl-us"
# user_managed_identity_us2 = "id-appgw-gl-us2"
# #----------------------------Resource Group Module Details for US region ------------------------------
# resource_group_location_us  = "East US"
# resource_group_name_us      = "RG-GL-ELX-US-NonProd"
# node_resource_group_name_us = "RG-GL-ELX-US-AKS-Node-Cluster-NonProd"
# virtual_network_name_us     = "VN-GL-ELX-US-NonProd"
# vnet_address_space_us       = ["10.217.0.0/16"]
# subnet_address_space_us     = ["10.217.3.0/24", "10.217.2.192/27", "10.217.2.0/25", "10.217.4.0/25"]

# appgw_pip_name_us       = "AAG-GL-ELX-US-NonProd-PIP"
# appgw_pip_allocation_us = "Static"
# appgw_name_us           = "AppGw-GL-ELX-US-NonProd"
# appgw_sku_name_us       = "WAF_v2"
# appgw_sku_tier_us       = "WAF_v2"
# appgw_sku_capacity_us   = 2
# appgw_ip_config_name_us = "AppGw-GL-ELX-US-IP-Config"
# subnet_id_us            = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US-NonProd/subnets/Subnet-GW"
# # ------------------------Resource Group Module Details for US2 region------------------------------

# resource_group_location_us2  = "East US 2"
# resource_group_name_us2      = "RG-GL-ELX-US2-NonProd"
# node_resource_group_name_us2 = "RG-GL-ELX-US2-AKS-Node-Cluster-NonProd"
# virtual_network_name_us2     = "VN-GL-ELX-US2-NonProd"
# vnet_address_space_us2       = ["10.218.0.0/16"]
# subnet_address_space_us2     = ["10.218.3.0/24", "10.218.2.192/27", "10.218.2.0/25", "10.218.4.0/25"]

# appgw_pip_name_us2       = "AAG-GL-ELX-US2-NonProd-PIP1"
# appgw_pip_allocation_us2 = "Static"
# appgw_name_us2           = "AppGw-GL-ELX-US2-NonProd"
# appgw_sku_name_us2       = "WAF_v2"
# appgw_sku_tier_us2       = "WAF_v2"
# appgw_sku_capacity_us2   = 2
# appgw_ip_config_name_us2 = "AppGw-GL-ELX-US2-IP-Config"
# subnet_id_us2            = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US2-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US2-NonProd/subnets/Subnet-GW"

# #----------------------------------------AKS EU------------------------------------------------

# log_analytics_name_eu = "LA-GL-ELX-AKS-WS-NonProd"
# la_sku                = "PerGB2018"
# la_solution_name      = "ContainerInsights"
# cluster_name_eu       = "AKS-Global-EU-NonProd"
# kubernetes_version    = "1.26.6"
# pod_security_policy   = false
# node_count            = 2
# node_vm_size          = "Standard_D2s_v3"
# os_disk_size_gb       = 80
# enable_auto_scaling   = true
# node_min_count        = 1
# node_max_count        = 5
# node_max_pods         = 60
# node_taints           = []
# node_labels = {
#   "service" = "kubernetes"
#   "env"     = "nonprod"
#   "project" = "myproject"
# }
# # Network profile
# aks_subnet_id_eu   = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-EU-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-EU-NonProd/subnets/Subnet-AKS"
# network_plugin     = "azure"
# network_policy     = "azure"
# pod_cidr           = "10.0.16.0/20"
# service_cidr       = "10.0.32.0/20"
# dns_service_ip     = "10.0.32.10"
# docker_bridge_cidr = "172.0.0.1/8"
# #----------------------------------------AKS US------------------------------------------------
# log_analytics_name_us = "LA-GL-ELX-AKS-US-NonProd"
# cluster_name_us       = "AKS-Global-US-NonProd"
# # Network profile
# aks_subnet_id_us = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US-NonProd/subnets/Subnet-AKS"
# # #----------------------------------------AKS US2------------------------------------------------
# log_analytics_name_us2 = "LA-GL-ELX-AKS-US2-NonProd"
# cluster_name_us2       = "AKS-Global-US2-NonProd"
# # Network profile
# aks_subnet_id_us2 = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US2-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US2-NonProd/subnets/Subnet-AKS"
# #------------------------------------------------------------------------------------------
# subnet_name       = ["Subnet-APIM", "Subnet-GW", "Subnet-AKS", "Subnet-fe"]
# service_endpoints = ["Microsoft.Sql", "Microsoft.KeyVault"]

# #----------------------------------Traffic Manager-----------------------------------------
# traffic_manager_name         = "tmelxglobalnonprod01"
# traffic_routing_method       = "Performance"
# ttl_value                    = 60
# protocol                     = "HTTPS"
# port                         = 443
# path                         = "/"
# interval_in_seconds          = 30
# timeout_in_seconds           = 10
# tolerated_number_of_failures = 3

# #-------------------------------------------APIM--------------------------------
# apim_subnet_id_eu         = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-EU-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-EU-NonProd/subnets/Subnet-APIM"
# apim_subnet_id_us         = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US-NonProd/subnets/Subnet-APIM"
# apim_subnet_id_us2        = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-US2-NonProd/providers/Microsoft.Network/virtualNetworks/VN-GL-ELX-US2-NonProd/subnets/Subnet-APIM"
# apim_name                 = "elxapimglnonprod"
# apim_publisher_name       = "Electrolux"
# apim_publisher_email      = "chirag.panchal@electrolux.com"
# apim_sku_name             = "Premium_1"
# gateway_hostname          = "api-nonprod.electrolux.com"
# developer_portal_hostname = "portal-nonprod.electrolux.com"
# management_hostname       = "management-nonprod.electrolux.com"
# scm_hostname              = "scm-nonprod.electrolux.com"
# #---------------------------Tags--------------------------------------------------
# env_tag          = "NonProd"
# owner_tag        = "Arun Nalliannan"
# account_tag      = "623065"
# billingid_tag    = "POC"
# costcenterit_tag = "10350645"
# sector_tag       = "Europe"
# created_by_tag   = "PanchChi(PETeam)"