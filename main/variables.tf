variable "subscription" {
  type = object({
    nonprod = object({
      tenant_id       = string
      subscription_id = string
    })
  })
}
variable "eu_vars" {
  type = object({
    resource_group = object({
      resource_group_location = string
      resource_group_name     = string
    })
    virtual_network = object({
      virtual_network_name = string
      vnet_address_space   = list(string)
      subnet_address_space = list(string)
      service_endpoints    = list(string)
      subnet_name          = list(string)
    })
    # app_gateway = object({
    #   appgw_pip_name       = string
    #   appgw_pip_allocation = string
    #   appgw_name           = string
    #   appgw_sku_name       = string
    #   appgw_sku_tier       = string
    #   appgw_sku_capacity   = number
    #   appgw_ip_config_name = string
    #   subnet_id          = string
    #   ssl_certificate_name  = string
    #   key_vault_secret_id   = string
    #   hostname              = string
    #   apim_address_pool     = list(string)
    #   user_managed_identity = string
    # })
    # traffic_manager = object({
    #   traffic_manager_name         = string
    #   traffic_routing_method       = string
    #   ttl_value                    = number
    #   protocol                     = string
    #   port                         = number
    #   path                         = string
    #   interval_in_seconds          = number
    #   timeout_in_seconds           = number
    #   tolerated_number_of_failures = number
    # })
    # api_management = object({
    #   apim_name                 = string
    #   apim_publisher_name       = string
    #   apim_publisher_email      = string
    #   apim_sku_name             = string
    #   gateway_hostname          = string
    #   developer_portal_hostname = string
    #   management_hostname       = string
    #   scm_hostname              = string
    # })
    acr = object({
      acr_name          = string
      acr_sku           = string
      acr_admin_enabled = bool
    })
    # dns_records = list(object({
    #   name    = string
    #   ttl     = number
    #   records = list(string)
    # }))
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
      resource_group_name     = string
    })
    virtual_network = object({
      virtual_network_name = string
      vnet_address_space   = list(string)
      subnet_address_space = list(string)
      service_endpoints    = list(string)
      subnet_name          = list(string)
    })
    # app_gateway = object({
    #   appgw_pip_name       = string
    #   appgw_pip_allocation = string
    #   appgw_name           = string
    #   appgw_sku_name       = string
    #   appgw_sku_tier       = string
    #   appgw_sku_capacity   = number
    #   appgw_ip_config_name = string
    #   subnet_id            = string
    #   user_managed_identity = string
    #   apim_address_pool     = list(string)
    # })
    # dns_records = list(object({
    #   name    = string
    #   ttl     = number
    #   records = list(string)
    # }))
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
      log_analytics_name          = string
      la_sku                      = string
      la_solution_name            = string
      cluster_name1               = string
      cluster_name2               = string
      kubernetes_version          = string
      pod_security_policy         = bool
      node_count                  = number
      node_vm_size                = string
      os_disk_size_gb             = number
      enable_auto_scaling         = bool
      node_min_count              = number
      node_max_count              = number
      node_max_pods               = number
      node_taints                 = list(string)
      node_labels                 = map(any)
      node_resource_group_name_eu = string
      node_resource_group_name_us = string
      #network profile
      aks_subnet_id_eu = string
      aks_subnet_id_us = string
      network_plugin     = string
      network_policy     = string
      pod_cidr           = string
      service_cidr       = string
      dns_service_ip     = string
      docker_bridge_cidr = string
    })
  })
}

# variable "waf_enabled" {
#   type        = bool
#   description = "Whether the Web Application Firewall should be enabled. Default to true"
#   default     = true
# }

# variable "waf_firewall_mode" {
#   type        = string
#   description = "The Web Application Firewall mode. Possible values are 'Detection' and 'Prevention'."
#   default     = "Detection"
# }

# variable "waf_rule_set_type" {
#   type        = string
#   description = "The type of rule set that should be used by the Web Application Firewall."
#   default     = "OWASP"
# }

# variable "waf_rule_set_version" {
#   type        = string
#   description = "The version of the rule set used for the Web Application Firewall."
#   default     = "3.0"
# }

# variable "waf_file_upload_limit_mb" {
#   type        = number
#   description = "(Optional) The file upload limit in megabytes. Defaults to 100MB"
#   default     = 100
# }

# variable "waf_request_body_check" {
#   type        = bool
#   description = "(Optional) Whether request body inspection should be enabled. Defaults to true"
#   default     = true
# }

# variable "waf_max_request_body_size_kb" {
#   type        = number
#   description = "(Optional) The maximum request body size in kilobytes. Defaults to 128KB"
#   default     = 128
# }

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