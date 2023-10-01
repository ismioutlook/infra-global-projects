variable "subscription" {
  type = object({
    nonprod = object({
      tenant_id = string
      subscription_id = string
    })
  })
}
variable "eu_vars" {
  type = object({
    resource_group = object({
      resource_group_location = string
      resource_group_name = string
    })
    virtual_network = object({
      virtual_network_name = string
      vnet_address_space = list(string)
      subnet_address_space = list(string)
      service_endpoints = list(string)
      subnet_name = list(string)
    })
    app_gateway = object({
      appgw_pip_name_eu     = string
      appgw_pip_allocation  = string
      appgw_name            = string
      appgw_sku_name        = string
      appgw_sku_tier        = string
      appgw_sku_capacity    = number
      appgw_ip_config_name  = string
      subnet_id          = string
      ssl_certificate_name  = string
      key_vault_secret_id   = string
      hostname              = string
      apim_address_pool     = list(string)
      user_managed_identity = string
    })
    traffic_manager = object({
      traffic_manager_name         = string 
      traffic_routing_method       = string
      ttl_value                    = number
      protocol                     = string
      port                         = number
      path                         = string
      interval_in_seconds          = number
      timeout_in_seconds           = number
      tolerated_number_of_failures = number
    })
    api_management = object({
      apim_subnet_id_eu         = string
      apim_subnet_id_us         = string
      apim_subnet_id_us2        = string
      apim_name                 = string
      apim_publisher_name       = string
      apim_publisher_email      = string
      apim_sku_name             = string
      gateway_hostname          = string
      developer_portal_hostname = string
      management_hostname       = string
      scm_hostname              = string
    })
    tags = object({
      env_tag          = string
      owner_tag        = string
      account_tag      = string
      billingid_tag    = string
      costcenterit_tag = string
      sector_tag       = string
      created_by_tag   = string
    })
  })
}

variable "us_vars" {
  type = object({
    resource_group = object({
      resource_group_location = string
      resource_group_name = string
    })
    virtual_network = object({
      virtual_network_name = string
      vnet_address_space = list(string)
      subnet_address_space = list(string)
      service_endpoints = list(string)
      subnet_name = list(string)
    })
    app_gateway = object({
      appgw_pip_name       = string
      appgw_pip_allocation = string
      appgw_name           = string
      appgw_sku_name       = string
      appgw_sku_tier       = string
      appgw_sku_capacity   = number
      appgw_ip_config_name = string
      subnet_id            = string
      user_managed_identity = string
      apim_address_pool     = list(string)
    })
    tags = object({
      env_tag          = string
      owner_tag        = string
      account_tag      = string
      billingid_tag    = string
      costcenterit_tag = string
      sector_tag       = string
      created_by_tag   = string
    })
  })
}


variable "us2_vars" {
  type = object({
    resource_group = object({
      resource_group_location = string
      resource_group_name = string
    })
    virtual_network = object({
      virtual_network_name = string
      vnet_address_space = list(string)
      subnet_address_space = list(string)
      service_endpoints = list(string)
      subnet_name = list(string)
    })
    app_gateway = object({
      appgw_pip_name       = string
      appgw_pip_allocation = string
      appgw_name           = string
      appgw_sku_name       = string
      appgw_sku_tier       = string
      appgw_sku_capacity   = number
      appgw_ip_config_name = string
      subnet_id            = string
      user_managed_identity = string
      apim_address_pool     = list(string)
    })
    tags = object({
      env_tag          = string
      owner_tag        = string
      account_tag      = string
      billingid_tag    = string
      costcenterit_tag = string
      sector_tag       = string
      created_by_tag   = string
    })
  })
}

variable "aks_vars" {
  type = object({
    azure_k8s_service = object({
      log_analytics_name = string
      la_sku             = string
      la_solution_name   = string
      cluster_name       = string 
      kubernetes_version = string
      pod_security_policy   = bool
      node_count            = number
      node_vm_size          = string
      os_disk_size_gb       = number
      enable_auto_scaling   = bool
      node_min_count        = number
      node_max_count        = number
      node_max_pods         = number
      node_taints           = list(string)
      node_labels = map(any)
      node_resource_group_name_eu = string
      node_resource_group_name_us = string
      node_resource_group_name_us2 = string
      #network profile
      aks_subnet_id_eu = string
      aks_subnet_id_us = string
      aks_subnet_id_us2 = string
      network_plugin       = string
      network_policy       = string
      pod_cidr             = string
      service_cidr         = string
      dns_service_ip       = string
      docker_bridge_cidr   = string
    })
  })
}
# variable "resource_group_name_eu" {
#   type        = string
#   description = "Name of the resource group in the EU region."
# }

# variable "node_resource_group_name_eu" {
#   type        = string
#   description = "Name of the resource group for AKS nodes EU region"
# }

# variable "resource_group_location_eu" {
#   type        = string
#   description = "Location of the resource group in the EU region."
# }

# variable "resource_group_location_us" {
#   type        = string
#   description = "Location of the resource group in the US region."
# }

# variable "resource_group_name_us" {
#   type        = string
#   description = "Name of the resource group in the US region."
# }

# variable "node_resource_group_name_us" {
#   type        = string
#   description = "Name of the resource group for AKS nodes US region"
# }


# variable "resource_group_location_us2" {
#   type        = string
#   description = "Location of the resource group in the Australia region."
# }

# variable "resource_group_name_us2" {
#   type        = string
#   description = "Name of the resource group in the Australia region."
# }

# variable "node_resource_group_name_us2" {
#   type        = string
#   description = "Name of the resource group for AKS nodes US2 region"
# }

# #-----------------------------Virtual Network module variables-----------------------------------------
# variable "virtual_network_name_eu" {
#   type        = string
#   description = "Name of the virtual network in the EU region."
# }

# variable "virtual_network_name_us" {
#   type        = string
#   description = "Name of the virtual network in the US region."
# }

# variable "virtual_network_name_us2" {
#   type        = string
#   description = "Name of the virtual network in the Australia region."
# }

# variable "vnet_address_space_eu" {
#   type        = list(string)
#   description = "Address space of the virtual network in the EU region."
# }

# variable "vnet_address_space_us" {
#   type        = list(string)
#   description = "Address space of the virtual network in the US region."
# }

# variable "vnet_address_space_us2" {
#   type        = list(string)
#   description = "Address space of the virtual network in the Australia region."
# }

# variable "subnet_name" {
#   type        = list(string)
#   description = "Name of the subnet."
# }

# variable "subnet_address_space_eu" {
#   type        = list(string)
#   description = "Address space of the subnet in the EU region."
# }

# variable "subnet_address_space_us" {
#   type        = list(string)
#   description = "Address space of the subnet in the US region."
# }

# variable "subnet_address_space_us2" {
#   type        = list(string)
#   description = "Address space of the subnet in the Australia region."
# }

# variable "service_endpoints" {
#   type        = list(string)
#   description = "List of service endpoints."
# }


# #--------------------------------------Traffic Manager--------------------------------------------------


# variable "traffic_manager_name" {
#   type        = string
#   description = "Name of the Traffic Manager."
# }

# variable "traffic_routing_method" {
#   type        = string
#   description = "Traffic routing method for the Traffic Manager."
# }

# variable "ttl_value" {
#   type        = number
#   description = "TTL value for DNS records."
# }

# variable "protocol" {
#   type        = string
#   description = "Protocol for health checks."
# }

# variable "port" {
#   type        = number
#   description = "Port number for health checks."
# }

# variable "path" {
#   type        = string
#   description = "Path for health checks."
# }

# variable "interval_in_seconds" {
#   type        = number
#   description = "Interval between health checks in seconds."
# }

# variable "timeout_in_seconds" {
#   type        = number
#   description = "Timeout for health checks in seconds."
# }

# variable "tolerated_number_of_failures" {
#   type        = number
#   description = "Number of tolerated failures for health checks."
# }

# # Azure Subscription 
# variable "tenant_id" {
#   type        = string
#   description = "Tenant id"
#   default     = "d2007bef-127d-4591-97ac-10d72fe28031"
# }

# variable "subscription_id" {
#   type        = string
#   description = "Azure Subscription ID"
#   default     = "f28071b5-e402-4c1a-83cc-ed0744ce8e0a"
# }

# #----------------------------Application Gateway-------------------------------------------
# variable "appgw_pip_name_eu" {
#   type        = string
#   description = "Name of the Application Gateway public IP for EU region."
# }

# variable "appgw_pip_allocation_eu" {
#   type        = string
#   description = "Allocation method for the Application Gateway public IP for EU region."
# }

# variable "appgw_name_eu" {
#   type        = string
#   description = "Name of the Application Gateway for EU region."
# }

# variable "appgw_sku_name_eu" {
#   type        = string
#   description = "Name of the Application Gateway SKU for EU region."
# }

# variable "appgw_sku_tier_eu" {
#   type        = string
#   description = "Tier of the Application Gateway SKU for EU region."
# }

# # variable "appgw_sku_capacity_eu" {
# #   type        = number
# #   description = "Capacity of the Application Gateway SKU for EU region."
# # }

# variable "appgw_ip_config_name_eu" {
#   type        = string
#   description = "Name of the Application Gateway IP configuration for EU region."
# }

# variable "subnet_id_eu" {
#   type        = string
#   description = "ID of the subnet for the Application Gateway IP configuration in EU region."
# }

# # variable "subnet_frontend_id" {
# #   description = "The ID of the frontend subnet"
# #   type        = string
# # }

# variable "ssl_certificate_name" {
#   description = "The name of the SSL certificate"
#   type        = string
# }

# variable "key_vault_secret_id" {
#   description = "The ID of the Key Vault secret"
#   type        = string
# }

# variable "hostname" {
#   description = "The hostname of the application"
#   type        = string
# }

# variable "apim_address_pool_eu" {
#   description = "The address pool for APIM (API Management) in the EU region"
#   type        = list(string)
# }

# variable "apim_address_pool_us" {
#   description = "The address pool for APIM (API Management) in the US region"
#   type        = list(string)
# }

# variable "apim_address_pool_us2" {
#   description = "The address pool for APIM (API Management) in the US2 region"
#   type        = list(string)
# }

# variable "user_managed_identity_eu" {
#   description = "The identifier for the user-managed identity in the West Europe region"
#   type        = string
# }

# variable "user_managed_identity_us" {
#   description = "The identifier for the user-managed identity in the US region"
#   type        = string
# }

# variable "user_managed_identity_us2" {
#   description = "The identifier for the user-managed identity in the US2 region"
#   type        = string
# }

# #---------------------------------------US--------------------------------
# variable "appgw_pip_name_us" {
#   type        = string
#   description = "Name of the Application Gateway public IP for US region."
# }

# variable "appgw_pip_allocation_us" {
#   type        = string
#   description = "Allocation method for the Application Gateway public IP for US region."
# }

# variable "appgw_name_us" {
#   type        = string
#   description = "Name of the Application Gateway for US region."
# }

# variable "appgw_sku_name_us" {
#   type        = string
#   description = "Name of the Application Gateway SKU for US region."
# }

# variable "appgw_sku_tier_us" {
#   type        = string
#   description = "Tier of the Application Gateway SKU for US region."
# }

# # variable "appgw_sku_capacity_us" {
# #   type        = number
# #   description = "Capacity of the Application Gateway SKU for US region."
# # }

# variable "appgw_ip_config_name_us" {
#   type        = string
#   description = "Name of the Application Gateway IP configuration for US region."
# }

# variable "subnet_id_us" {
#   type        = string
#   description = "ID of the subnet for the Application Gateway IP configuration in US region."
# }

# #---------------------------------------------US2-------------------------------------------
# variable "appgw_pip_name_us2" {
#   type        = string
#   description = "Name of the Application Gateway public IP for US2 region."
# }

# variable "appgw_pip_allocation_us2" {
#   type        = string
#   description = "Allocation method for the Application Gateway public IP for US2 region."
# }

# variable "appgw_name_us2" {
#   type        = string
#   description = "Name of the Application Gateway for US2 region."
# }

# variable "appgw_sku_name_us2" {
#   type        = string
#   description = "Name of the Application Gateway SKU for US2 region."
# }

# variable "appgw_sku_tier_us2" {
#   type        = string
#   description = "Tier of the Application Gateway SKU for US2 region."
# }

# # variable "appgw_sku_capacity_us2" {
# #   type        = number
# #   description = "Capacity of the Application Gateway SKU for US2 region."
# # }

# variable "appgw_ip_config_name_us2" {
#   type        = string
#   description = "Name of the Application Gateway IP configuration for US2 region."
# }

# variable "subnet_id_us2" {
#   type        = string
#   description = "ID of the subnet for the Application Gateway IP configuration in US2 region."
# }

variable "waf_enabled" {
  type        = bool
  description = "Whether the Web Application Firewall should be enabled. Default to true"
  default     = true
}

variable "waf_firewall_mode" {
  type        = string
  description = "The Web Application Firewall mode. Possible values are 'Detection' and 'Prevention'."
  default     = "Detection"
}

variable "waf_rule_set_type" {
  type        = string
  description = "The type of rule set that should be used by the Web Application Firewall."
  default     = "OWASP"
}

variable "waf_rule_set_version" {
  type        = string
  description = "The version of the rule set used for the Web Application Firewall."
  default     = "3.0"
}

variable "waf_file_upload_limit_mb" {
  type        = number
  description = "(Optional) The file upload limit in megabytes. Defaults to 100MB"
  default     = 100
}

variable "waf_request_body_check" {
  type        = bool
  description = "(Optional) Whether request body inspection should be enabled. Defaults to true"
  default     = true
}

variable "waf_max_request_body_size_kb" {
  type        = number
  description = "(Optional) The maximum request body size in kilobytes. Defaults to 128KB"
  default     = 128
}


# #------------------------------------------AKS Cluster EU------------------------------------#

# # LogAnalytics workspace & Solution details

# variable "log_analytics_name_eu" {
#   type        = string
#   description = "The Name of the log analytics workspace "
# }

# variable "la_sku" {
#   type        = string
#   description = "log analytics workspace sku or pricing tier"
#   #default     = "PerGB2018"
# }

# variable "la_solution_name" {
#   type        = string
#   description = "log analytics solution name"
#   #default     = "ContainerInsights"
# }

# # Kubernetes cluster

# variable "cluster_name_eu" {
#   type        = string
#   description = "Name of the AKS cluster"
# }


# variable "kubernetes_version" {
#   type        = string
#   description = "The AKS Kubernetes version"
# }


# variable "pod_security_policy" {
#   type        = bool
#   description = "Enable PodSecurityPolicy the Kubernetes API"
# }



# # Default node pool

# variable "node_count" {
#   type        = number
#   description = "The default node pool instance count"
# }

# variable "node_vm_size" {
#   type        = string
#   description = "The Azure VM instance type"
#   # default     = "Standard_D2s_v3"
# }

# variable "os_disk_size_gb" {
#   default     = 80
#   type        = number
#   description = "Default node pool disk size"
# }

# variable "enable_auto_scaling" {
#   type        = bool
#   description = "Enable autoscaling on the default node pool"
# }

# variable "node_min_count" {
#   default     = 1
#   type        = number
#   description = "Default node pool intial count (used with autoscaling)"
# }

# variable "node_max_count" {
#   default     = 5
#   type        = number
#   description = "Default node pool max count (use with autoscaling)"
# }

# variable "node_max_pods" {
#   default     = 60
#   type        = number
#   description = "Total amount of pods allowed per node"
# }

# variable "node_taints" {
#   type        = list(string)
#   description = "Taints for default pool nodes"
# }

# variable "node_labels" {
#   description = "A map of Kubernetes labels which should be applied to nodes in the Default Node Pool"
#   type        = map(any)
#   default = {
#     "service" = "kubernetes"
#   }
# }

# # Addons node pool

variable "node_pools" {
  description = "Addons node pools"
  type = list(object({
    name                = string
    vm_size             = string
    os_disk_size_gb     = number
    enable_auto_scaling = bool
    node_count          = number
    min_count           = number
    max_count           = number
    max_pods            = number
    node_taints         = list(string)
    node_labels         = map(string)
  }))
  default = []
}

# # Network profile

# variable "network_plugin" {
#   type        = string
#   description = "The CNI network plugin to use (only azure, or kubenet)"
# }

# variable "network_policy" {
#   type        = string
#   description = "The network polcy for the CNI. Only used when network_plugin is set to azure. Supported values: calico, azure"
# }

# variable "pod_cidr" {
#   type        = string
#   description = "The CIDR for the pod network"
# }

# variable "service_cidr" {
#   type        = string
#   description = "The CIDR for kubernetes services"
# }

# variable "dns_service_ip" {
#   type        = string
#   description = "IP address within the Kubernetes service address range that will be used by cluster service discovery"
# }

# variable "docker_bridge_cidr" {
#   type        = string
#   description = " IP address (in CIDR notation) used as the Docker bridge IP address on nodes"
# }


# # Auto-scaler profile

variable "balance_similar_node_groups" {
  description = "Detect similar node groups and balance the number of nodes between them"
  type        = bool
  default     = false
}

variable "max_graceful_termination_sec" {
  description = "Maximum number of seconds the cluster autoscaler waits for pod termination when trying to scale down a node"
  type        = string
  default     = "600"
}

variable "scan_interval" {
  description = "How often the AKS Cluster should be re-evaluated for scale up/down"
  type        = string
  default     = "10s"
}


variable "scale_down_delay_after_add" {
  description = "How long after the scale up of AKS nodes the scale down evaluation resumes"
  type        = string
  default     = "10m"
}

variable "scale_down_delay_after_delete" {
  type        = string
  description = "How long after node deletion that scale down evaluation resumes"
  default     = "10s"
}

variable "scale_down_delay_after_failure" {
  description = "How long after scale down failure that scale down evaluation resumes"
  type        = string
  default     = "10m"
}

variable "scale_down_unneeded" {
  description = "How long a node should be unneeded before it is eligible for scale down"
  type        = string
  default     = "10m"
}

variable "scale_down_unready" {
  description = "How long an unready node should be unneeded before it is eligible for scale down"
  type        = string
  default     = "10m"
}

variable "scale_down_utilization_threshold" {
  description = "Node utilization level, defined as sum of requested resources divided by capacity, below which a node can be considered for scale down"
  type        = string
  default     = "0.5"
}

# variable "aks_subnet_id_eu" {
#   type        = string
#   description = "add subnet id for aks"
# }


# #----------------------------AKS US--------------------------
# variable "aks_subnet_id_us" {
#   type        = string
#   description = "add subnet id for aks"
# }

# variable "log_analytics_name_us" {
#   type        = string
#   description = "add log analytics name for us"
# }

# variable "cluster_name_us" {
#   type        = string
#   description = "add Aks cluster name for us"
# }
# #----------------------------AKS US2--------------------------
# variable "aks_subnet_id_us2" {
#   type        = string
#   description = "add subnet id for aks"
# }

# variable "log_analytics_name_us2" {
#   type        = string
#   description = "add log analytics name for us"
# }

# variable "cluster_name_us2" {
#   type        = string
#   description = "add Aks cluster name for us"
# }

# #-----------------------------------------------------APIM-----------------------------------------------
# variable "apim_subnet_id_eu" {
#   type        = string
#   description = "add subnet id for EU APIM "
# }

# variable "apim_subnet_id_us" {
#   type        = string
#   description = "add subnet id for US APIM"
# }

# variable "apim_subnet_id_us2" {
#   type        = string
#   description = "add subnet id for US2 APIM"
# }

# variable "apim_name" {
#   description = "API Mnagement Name"
#   type        = string
# }

# variable "apim_publisher_name" {
#   type        = string
#   default     = "Electrolux"
#   description = "value"
# }

# variable "apim_publisher_email" {
#   type        = string
#   default     = "ram.patreddy@electrolux.com"
#   description = "value"
# }

# variable "apim_sku_name" {
#   type        = string
#   description = "APIM SKU type"
#   #default     = "Premium_1"
# }

# variable "gateway_hostname" {
#   description = "The hostname for the gateway of the API Management service."
#   type        = string
# }

# variable "developer_portal_hostname" {
#   description = "The hostname for the developer portal of the API Management service."
#   type        = string
# }

# variable "management_hostname" {
#   description = "The hostname for the management endpoint of the API Management service."
#   type        = string
# }

# variable "scm_hostname" {
#   description = "The hostname for the SCM endpoint of the API Management service."
#   type        = string
# }
# #-----------------------------------------------------Tags--------------------------------------------------------
# variable "owner_tag" {
#   type = string
#   #default     = "Arun Nalliannan"
#   description = "Owner of the resource"
# }

# variable "account_tag" {
#   type = string
#   #default     = "623065"
#   description = "Account"
# }

# variable "billingid_tag" {
#   type = string
#   #default     = "MyAccounts"
#   description = "Billing ID"
# }

# variable "costcenterit_tag" {
#   type = string
#   #default     = "10350645"
#   description = "Cost Center"
# }

# variable "sector_tag" {
#   type = string
#   #default     = "BAEurope"
#   description = "Sector"
# }

# variable "env_tag" {
#   type = string
#   #default     = "DEV"
#   description = "Environment used in the tags of the resources"
# }

# variable "created_by_tag" {
#   type = string
#   #default     = "PETeam"
#   description = "mention created by tag"
# }