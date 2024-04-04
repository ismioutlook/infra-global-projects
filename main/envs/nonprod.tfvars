subscription = {
  subscription = {
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
    api_hostname            = "api-eu-nonprod.int.electrolux.com"
    mgmt_hostname           = "mss-eu-nonprod.int.electrolux.com"
    portal_hostname         = "portal-eu-nonprod.int.electrolux.com"
    scm_hostname            = "scm-eu-nonprod.int.electrolux.com"
    grafana_hostname        = "grafana-eu-nonprod.int.electrolux.com"
    k8s_dashboard_hostname  = "k8sdashboard-eu-nonprod.int.electrolux.com"
    origin_api_hostname     = "origin-api-eu-nonprod.electrolux.com"
    origin_portal_hostname  = "origin-portal-eu-nonprod.electrolux.com"
    origin_mgmt_hostname    = "origin-mss-eu-nonprod.electrolux.com"
    origin_scm_hostname     = "origin-scm-eu-nonprod.electrolux.com"
    origin_grafana_hostname = "origin-grafana-eu-nonprod.electrolux.com"
    apim_address_pool       = ["10.221.188.4"]
    grafana_address_pool    = ["10.221.184.103"]
    user_managed_identity   = "id-appgw-gl-westeu"
  }
  api_management = {
    apim_name                 = "elxapimglnonprod01"
    apim_publisher_name       = "Electrolux"
    apim_publisher_email      = "chirag.panchal@electrolux.com"
    apim_sku_name             = "Premium_1"
    gateway_hostnames         = ["api-eu-nonprod.int.electrolux.com", "api-us-nonprod.int.electrolux.com"] #, "api-us-nonprod.int.electrolux.com"]
    developer_portal_hostname = "portal-eu-nonprod.int.electrolux.com"
    management_hostname       = "mss-eu-nonprod.int.electrolux.com"
    scm_hostname              = "scm-eu-nonprod.int.electrolux.com"
    apim_subnet_id_eu         = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/APIM-SBNT-001"
    key_vault_secret_id       = "https://elxkv-cert-nonprod-gl-01.vault.azure.net/secrets/int-electrolux-com"
    additional_locations = [
      # {
      #   location    = "Southeast Asia"
      #   capacity    = 1
      #   subnet_id   = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-APAC-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-APAC-Concent-NonProd-Spoke-001/subnets/APIM-SBT-01"
      #   pip_name    = "pip-elxapimglnonprod01-apac"
      #   domain_name = "elxapimglnonprod01"
      # }
      {
        location    = "East US"
        capacity    = 1
        subnet_id   = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-EUS-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-NonProd-Spoke-001/subnets/APIM-SBT-01"
        pip_name    = "pip-elxapimglnonprod01-eus"
        domain_name = "elxapimglnonprod01"
      }
      // Add more additional locations as needed
    ]
  }
  virtual_network = {
    vnet_resource_group_name = "RG-ELX-GL-Concent-NonProd-Networking"
    virtual_network_name     = "VN-ELX-GL-Concent-NonProd-Spoke-002"
    apim_subnet_name         = "APIM-SBNT-001"
    appgw_subnet_name        = "APPGW-SBNT-001"
    aks_subnet_name          = "AKS-SBNT-001"
    pv_endpoint_subnet_name  = "PV-ENDPOINTS-SBNT-001"
  }
  network_security_group = {
    nsg_apim_name  = "nsg-apim-gl-nonprod"
    nsg_appgw_name = "nsg-gw-gl-nonprod"
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

aks_vars = {
  azure_k8s_service = {
    cluster_name1 = "AKS-MSS-NonProd-EU-01"
    # cluster_name2           = "AKS-Global-US-NonProd"
    log_analytics_name = "LA-GL-WS-NonProd-EU-01"
    la_sku             = "PerGB2018"
    la_solution_name   = "ContainerInsights"
    # cluster_name3           = "AKS-Global-APAC-NonProd"
    sku_tier            = "Standard"
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
    # Network profile
    aks_subnet_id_eu   = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/AKS-SBNT-001"
    network_plugin     = "azure"
    network_policy     = "azure"
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
node_pools = [
  {
    name                = "odlcorepool"
    vm_size             = "Standard_DS3_v2"
    os_disk_size_gb     = 512
    enable_auto_scaling = true
    node_count          = 2
    min_count           = 1
    max_count           = 3
    max_pods            = 60
    node_taints         = ["workloadtype=spark:NoSchedule"]
    node_labels = {
      "workloadtype" = "spark"
    }
  },
  {
    name                = "odlnodepool"
    vm_size             = "Standard_DS3_v2"
    os_disk_size_gb     = 512
    enable_auto_scaling = true
    node_count          = 3
    min_count           = 1
    max_count           = 3
    max_pods            = 60
    node_taints         = ["workloadtype=import-services:NoSchedule"]
    node_labels = {
      "workloadtype" = "import-services"
    }
  }
]