subscription = {
  subscription = {
    tenant_id       = "d2007bef-127d-4591-97ac-10d72fe28031"
    subscription_id = "9a44d85a-3cf1-4938-9509-c8f94b1aee10"
  }
}

eu_vars = {
  resource_group = {
    resource_group_location = "West Europe"
    resource_group_name     = "RG-GL-ELX-EU-Prod-01"
  }
  virtual_network = {
    vnet_resource_group_name = "RG-ELX-EU-Concent-Prod-Networking"
    virtual_network_name = "VN-ELX-EU-Concent-Prod-Spoke-001"
  }
  app_gateway = {
    appgw_pip_name         = "pip-appgw-gl-elx-eu-prod-01"
    appgw_pip_allocation   = "Static"
    appgw_name             = "AppGw-GL-ELX-EU-Prod-01"
    appgw_sku_name         = "WAF_v2"
    appgw_sku_tier         = "WAF_v2"
    appgw_sku_capacity     = 2
    appgw_ip_config_name   = "AppGw-GL-ELX-EU-IP-Config-01"
    subnet_id              = "/subscriptions/9a44d85a-3cf1-4938-9509-c8f94b1aee10/resourceGroups/RG-ELX-GL-Concent-Prod-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EU-Concent-Prod-Spoke-001/subnets/APPGW-SBNT-001"
    ssl_certificate_name   = "san-external-electrolux-com"
    key_vault_secret_id    = "https://elxkv-cert-prod-gl-01.vault.azure.net/secrets/san-external-electrolux-com"
    api_hostname           = "api-eu-prod.int.electrolux.com"
    mgmt_hostname          = "mss-eu-prod.int.electrolux.com"
    portal_hostname        = "portal-eu-prod.int.electrolux.com"
    scm_hostname           = "scm-eu-prod.int.electrolux.com"
    origin_api_hostname    = "origin-api-eu-prod.electrolux.com"
    origin_portal_hostname = "origin-portal-eu-prod.electrolux.com"
    origin_mgmt_hostname   = "origin-mss-eu-prod.electrolux.com"
    origin_scm_hostname    = "origin-scm-eu-prod.electrolux.com"
    apim_address_pool      = ["10.221.188.4"]
    user_managed_identity  = "id-appgw-gl-westeu"
  }
  api_management = {
    apim_name                 = "elxapimglprod01"
    apim_publisher_name       = "Electrolux"
    apim_publisher_email      = "chirag.panchal@electrolux.com"
    apim_sku_name             = "Premium_1"
    gateway_hostnames         = ["api-eu-prod.int.electrolux.com"] #, "api-us-prod.int.electrolux.com"]
    developer_portal_hostname = "portal-eu-prod.int.electrolux.com"
    management_hostname       = "mss-eu-prod.int.electrolux.com"
    scm_hostname              = "scm-eu-prod.int.electrolux.com"
    apim_subnet_id_eu         = "/subscriptions/9a44d85a-3cf1-4938-9509-c8f94b1aee10/resourceGroups/RG-ELX-GL-Concent-Prod-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EU-Concent-Prod-Spoke-001/subnets/APIM-SBNT-001"
    key_vault_secret_id       = "https://elxkv-cert-prod-gl-01.vault.azure.net/secrets/int-electrolux-com"
    additional_locations = [
      # {
      #   location  = "Southeast Asia"
      #   capacity  = 1
      #   subnet_id = "/subscriptions/9a44d85a-3cf1-4938-9509-c8f94b1aee10/resourceGroups/RG-ELX-APAC-Concent-Prod-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-APAC-Concent-Prod-Spoke-001/subnets/APIM-SBT-01"
      #   pip_name = "pip-elxapimglprod01-apac"
      #   domain_name = "elxapimglprod01"
      # }
      // Add more additional locations as needed
    ]
  }
  acr = {
    acr_name          = "elxacrglprod01"
    acr_sku           = "Basic"
    acr_admin_enabled = true
  }

  tags = {
    env_tag          = "Prod"
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
    cluster_name1 = "AKS-MSS-Prod-EU-01"
    # cluster_name2           = "AKS-Global-US-Prod"
    log_analytics_name = "LA-GL-WS-Prod-EU-01"
    la_sku             = "PerGB2018"
    la_solution_name   = "ContainerInsights"
    # cluster_name3           = "AKS-Global-APAC-Prod"
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
      "env"     = "prod"
      "project" = "mss"
      "mode"    = "system"
    }
    node_resource_group_name_eu = "RG-AKS-MSS-Node-Config-Prod-EU-01"
    # Network profile
    aks_subnet_id_eu   = "/subscriptions/9a44d85a-3cf1-4938-9509-c8f94b1aee10/resourceGroups/RG-ELX-GL-Concent-Prod-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EU-Concent-Prod-Spoke-001/subnets/AKS-SBNT-001"
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