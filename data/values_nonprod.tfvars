subscription = {
  nonprod = {
    tenant_id       = "d2007bef-127d-4591-97ac-10d72fe28031"
    subscription_id = "4731e47d-991b-4fbd-86aa-1e861607b82f"
  }
}

eu_vars = {
  resource_group = {
    resource_group_location = "West Europe"
    resource_group_name     = "RG-GL-ELX-EU-NonProd-01"
  }
  # application_insights = {
  #   app_insights_name = "AI-GL-ELX-EU-NonProd-01"
  #   app_insights_type = "web"
  # }
  app_gateway = {
    appgw_pip_name       = "pip-appgw-gl-elx-eu-nonprod-01" #"AAG-GL-ELX-EU-NonProd-PIP"
    appgw_pip_allocation = "Static"
    appgw_name           = "AppGw-GL-ELX-EU-NonProd-01"
    appgw_sku_name       = "WAF_v2"
    appgw_sku_tier       = "WAF_v2"
    appgw_sku_capacity   = 2
    appgw_ip_config_name = "AppGw-GL-ELX-EU-IP-Config-01"
    subnet_id            = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/APPGW-SBNT-001"
    ssl_certificate_name = "san-external-electrolux-com"
    key_vault_secret_id  = "https://elxkv-cert-nonprod-gl-01.vault.azure.net/secrets/san-external-electrolux-com"
    #trusted_root_certificate_id = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-EU-NonProd/providers/Microsoft.Network/applicationGateways/AppGw-GL-ELX-EU-NonProd/trustedRootCertificates/ElectroluxRootCA2"
    api_hostname           = "api-eu-nonprod.int.electrolux.com"
    mgmt_hostname          = "mss-eu-nonprod.int.electrolux.com"
    portal_hostname        = "portal-eu-nonprod.int.electrolux.com"
    scm_hostname           = "scm-eu-nonprod.int.electrolux.com"
    origin_api_hostname    = "origin-api-eu-nonprod.electrolux.com"
    origin_portal_hostname = "origin-portal-eu-nonprod.electrolux.com"
    origin_mgmt_hostname   = "origin-mss-eu-nonprod.electrolux.com"
    origin_scm_hostname    = "origin-scm-eu-nonprod.electrolux.com"
    apim_address_pool      = ["10.221.188.4"]
    user_managed_identity  = "id-appgw-gl-westeu"
  }
  api_management = {
    apim_name                 = "elxapimglnonprod01"
    apim_publisher_name       = "Electrolux"
    apim_publisher_email      = "chirag.panchal@electrolux.com"
    apim_sku_name             = "Premium_1"
    gateway_hostnames         = ["api-eu-nonprod.int.electrolux.com"] #, "api-us-nonprod.int.electrolux.com"]
    developer_portal_hostname = "portal-eu-nonprod.int.electrolux.com"
    management_hostname       = "mss-eu-nonprod.int.electrolux.com"
    scm_hostname              = "scm-eu-nonprod.int.electrolux.com"
    apim_subnet_id_eu         = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/APIM-SBNT-001"
    key_vault_secret_id       = "https://elxkv-cert-nonprod-gl-01.vault.azure.net/secrets/int-electrolux-com"
    additional_locations = [
      {
        location  = "Southeast Asia"
        capacity  = 1
        subnet_id = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-APAC-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-APAC-Concent-NonProd-Spoke-001/subnets/APIM-SBT-01"
        pip_name = "pip-elxapimglnonprod01-eus"
        domain_name = "elxapimglnonprod01"
      }
      // Add more additional locations as needed
    ]
  }
  acr = {
    acr_name          = "elxacrglnonprod01"
    acr_sku           = "Basic"
    acr_admin_enabled = true
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

# #---------------------------------------------------US Vars group-------------------------------------------------------------------
# us_vars = {
#   resource_group = {
#     resource_group_location = "East US"
#     resource_group_name     = "RG-GL-ELX-US-NonProd"
#   }
#   # app_gateway = {
#   #   appgw_pip_name       = "AAG-GL-ELX-US-NonProd-PIP"
#   #   appgw_pip_allocation = "Static"
#   #   appgw_name           = "AppGw-GL-ELX-US-NonProd"
#   #   appgw_sku_name       = "WAF_v2"
#   #   appgw_sku_tier       = "WAF_v2"
#   #   appgw_sku_capacity   = 2
#   #   appgw_ip_config_name = "AppGw-GL-ELX-US-IP-Config"
#   #   subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-EUS-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-NonProd-Spoke-001/subnets/AppGW-SBT-01"
#   #   user_managed_identity = "id-appgw-gl-us"
#   #   apim_address_pool     = ["10.216.118.6"]
#   # }

#   tags = {
#     env_tag          = "NonProd"
#     owner_tag        = "Arun Nalliannan"
#     account_tag      = "623065"
#     billingid_tag    = "Global"
#     costcenterit_tag = "10350645"
#     sector_tag       = "East US"
#     created_by_tag   = "PETeam(PanchChi)"
#   }
# }

# #---------------------------------------------------APAC Vars group-------------------------------------------------------------------
# apac_vars = {
#   resource_group = {
#     resource_group_location = "Southeast Asia"
#     resource_group_name     = "RG-GL-ELX-APAC-NonProd"
#   }
#   app_gateway = {
#     appgw_pip_name        = "AAG-GL-ELX-APAC-NonProd-PIP"
#     appgw_pip_allocation  = "Static"
#     appgw_name            = "AppGw-GL-ELX-APAC-NonProd"
#     appgw_sku_name        = "WAF_v2"
#     appgw_sku_tier        = "WAF_v2"
#     appgw_sku_capacity    = 2
#     appgw_ip_config_name  = "AppGw-GL-ELX-APAC-IP-Config"
#     subnet_id             = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-APAC-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-APAC-Concent-NonProd-Spoke-001/subnets/AppGW-SBT-01"
#     ssl_certificate_name  = "san-external-electrolux-com"
#     key_vault_secret_id   = "https://elxkv-cert-nonprod-gl-01.vault.azure.net/secrets/san-external-electrolux-com"
#     api_hostname          = "api-apac-nonprod.int.electrolux.com"
#     mgmt_hostname         = "mss-apac-nonprod.int.electrolux.com"
#     origin_api_hostname   = "origin-api-apac-nonprod.electrolux.com"
#     origin_mgmt_hostname  = "origin-mss-apac-nonprod.electrolux.com"
#     apim_address_pool     = ["10.216.118.6"]
#     user_managed_identity = "id-appgw-gl-apac"
#   }
#   tags = {
#     env_tag          = "NonProd"
#     owner_tag        = "Arun Nalliannan"
#     account_tag      = "623065"
#     billingid_tag    = "Global"
#     costcenterit_tag = "10350645"
#     sector_tag       = "Southeast Asia"
#     created_by_tag   = "PETeam(PanchChi)"
#   }
# }
# #---------------------------------------------------AKS Vars group-------------------------------------------------------------------

aks_vars = {
  azure_k8s_service = {
    cluster_name1 = "AKS-MSS-NonProd-EU-01"
    # cluster_name2           = "AKS-Global-US-NonProd"
    log_analytics_name      = "LA-GL-WS-NonProd-EU-01"
    la_sku                  = "PerGB2018"
    la_solution_name        = "ContainerInsights"
    # cluster_name3           = "AKS-Global-APAC-NonProd"
    sku_tier            = "Paid"
    kubernetes_version  = "1.27.7"
    pod_security_policy = false
    node_count          = 4
    node_vm_size        = "Standard_D4s_v3"
    os_disk_size_gb     = 120
    enable_auto_scaling = true
    node_min_count      = 2
    node_max_count      = 4
    node_max_pods       = 60
    node_taints         = []
    node_labels = {
      "service" = "microservices"
      "env"     = "nonprod"
      "project" = "mss"
      "mode"    = "system"
    }
    node_resource_group_name_eu = "RG-AKS-MSS-Node-Config-NonProd-EU-01"
    # node_resource_group_name_us   = "RG-GL-ELX-US-AKS-Node-Cluster-NonProd"
    # node_resource_group_name_apac = "RG-GL-ELX-APAC-AKS-Node-Cluster-NonProd"
    # Network profile
    aks_subnet_id_eu = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/AKS-SBNT-001"
    # aks_subnet_id_us   = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-EUS-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-NonProd-Spoke-001/subnets/AKS-SBT-01"
    # aks_subnet_id_apac = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-APAC-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-APAC-Concent-NonProd-Spoke-001/subnets/AKS-SBT-01"
    network_plugin = "azure"
    network_policy = "azure"
    # kubenet_network_plugin     = "kubenet"
    # kubenet_network_policy     = "kubenet"
    pod_cidr           = "10.0.16.0/20"
    service_cidr       = "10.0.32.0/20"
    dns_service_ip     = "10.0.32.10"
    docker_bridge_cidr = "172.0.0.1/8"
    #User Node Pool
    user_os_disk_size_gb     = 512
    user_node_vm_size        = "Standard_DS4_v2"
    user_node_count          = 10
    user_enable_auto_scaling = true
    user_node_min_count      = 4
    user_node_max_count      = 10
    user_node_max_pods       = 60
    user_node_taints         = []
    user_node_labels = {
      "mode" = "user"
    }
  }
}