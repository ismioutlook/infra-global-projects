variable "subscription" {
  type = object({
    subscription = object({
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
      vnet_resource_group_name = string
      virtual_network_name     = string
      apim_subnet_name         = string
      appgw_subnet_name        = string
      aks_subnet_name          = string
      pv_endpoint_subnet_name  = string
    })
    # application_insights = object ({
    #   app_insights_name = string
    #   app_insights_type = string
    # })
    app_gateway = object({
      appgw_pip_name       = string
      appgw_pip_allocation = string
      appgw_name           = string
      appgw_sku_name       = string
      appgw_sku_tier       = string
      appgw_sku_capacity   = number
      appgw_ip_config_name = string
      subnet_id            = string
      ssl_certificate_name = string
      key_vault_secret_id  = string
      #trusted_root_certificate_id = string
      api_hostname            = string
      origin_api_hostname     = string
      grafana_hostname        = string
      origin_grafana_hostname = string
      mgmt_hostname           = string
      portal_hostname         = string
      origin_portal_hostname  = string
      origin_mgmt_hostname    = string
      origin_scm_hostname     = string
      scm_hostname            = string
      k8s_dashboard_hostname  = string
      apim_address_pool       = list(string)
      grafana_address_pool    = list(string)
      user_managed_identity   = string
    })
    api_management = object({
      apim_name                 = string
      apim_publisher_name       = string
      apim_publisher_email      = string
      apim_sku_name             = string
      gateway_hostnames         = list(string)
      developer_portal_hostname = string
      management_hostname       = string
      scm_hostname              = string
      apim_subnet_id_eu         = string
      key_vault_secret_id       = string
      additional_locations = list(object({
        location    = string
        capacity    = number
        subnet_id   = string
        pip_name    = string
        domain_name = string
      }))
    })
    acr = object({
      acr_name          = string
      acr_sku           = string
      acr_admin_enabled = bool
    })
    network_security_group = object({
      nsg_apim_name  = string
      nsg_appgw_name = string
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
      cluster_name1 = string
      # cluster_name2               = string
      log_analytics_name = string
      la_sku             = string
      la_solution_name   = string
      sku_tier           = string
      # cluster_name3               = string
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
      #network profile
      aks_subnet_id_eu   = string
      network_plugin     = string
      network_policy     = string
      pod_cidr           = string
      service_cidr       = string
      dns_service_ip     = string
      docker_bridge_cidr = string
      #User nodepool
      user_os_disk_size_gb     = number
      user_node_vm_size        = string
      user_node_count          = number
      user_enable_auto_scaling = bool
      user_node_min_count      = number
      user_node_max_count      = number
      user_node_max_pods       = number
      user_node_taints         = list(string)
      user_node_labels         = map(any)
    })
  })
}

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

variable "rbac_aad" {
  type        = bool
  default     = true
  description = "(Optional) Is Azure Active Directory integration enabled?"
  nullable    = false
}

variable "rbac_aad_azure_rbac_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Is Role Based Access Control based on Azure AD enabled?"
}

variable "role_based_access_control_enabled" {
  type        = bool
  default     = true
  description = "Enable Role Based Access Control."
  nullable    = false
}

variable "aks_builtin_role_assignments" {
  type = map(object({
    principal_group_names = list(string)
  }))
  description = "Map to assign builtin AKS Azure RBAC roles to principals. Key must be RBAC role name like Azure Kubernetes Service Cluster User. The scope is cluster level"
  default = {
    "Azure Kubernetes Service RBAC Cluster Admin" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-PE-Admin"]
    }
    "Azure Kubernetes Service Cluster User Role" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-PE-Read", "CSA-AAD-PRJ-Concent-ONL-Read", "CSA-AAD-PRJ-Concent-SRE-Read", "CSA-AAD-PRJ-Concent-SRPartner",
        "CSA-AAD-PRJ-Concent-ODL-Developer", "CSA-AAD-PRJ-Concent-SHAb-Developer", "CSA-AAD-PRJ-Concent-SRE-Write",
        "CSA-AAD-PRJ-Concent-SRDirect", "CSA-AAD-PRJ-Concent-Developer",
      "CSA-AAD-PRJ-Concent-SHAg-Developer"]
    }
    "Azure Kubernetes Service RBAC Reader" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-PE-Read", "CSA-AAD-PRJ-Concent-ONL-Read", "CSA-AAD-PRJ-Concent-SRE-Read", "CSA-AAD-PRJ-Concent-SRPartner",
        "CSA-AAD-PRJ-Concent-ODL-Developer", "CSA-AAD-PRJ-Concent-SHAb-Developer",
        "CSA-AAD-PRJ-Concent-SRDirect", "CSA-AAD-PRJ-Concent-Developer",
      "CSA-AAD-PRJ-Concent-SHAg-Developer"]
    }
    "Azure Kubernetes Service RBAC Writer" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-SRE-Write"]
    }
  }
}

variable "apim_builtin_role_assignments" {
  type = map(object({
    principal_group_names = list(string)
  }))
  description = "Map to assign builtin APIM roles to principals. Key must be Builtin role names."
  default = {
    "API Management Service Reader Role" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-ODL-Developer", "CSA-AAD-PRJ-Concent-SRPartner",
        "CSA-AAD-PRJ-Concent-SRDirect", "CSA-AAD-PRJ-Concent-Developer", "CSA-AAD-PRJ-Concent-SHAb-Developer",
      "CSA-AAD-PRJ-Concent-SHAg-Developer"]
    }
  }
}

variable "app_insights_details" {
  type = object({
    name                = string
    resource_group_name = string
  })
  description = "Details of of application insights"
  default     = null
}

variable "app_insights_builtin_role_assignments" {
  type = map(object({
    principal_group_names = list(string)
  }))
  description = "Map to assign builtin roles to principals to grant access to app insights. Key must be Builtin role names."
  default = {
    "Monitoring Reader" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-ODL-Developer", "CSA-AAD-PRJ-Concent-SRPartner",
        "CSA-AAD-PRJ-Concent-SRDirect", "CSA-AAD-PRJ-Concent-Developer", "CSA-AAD-PRJ-Concent-SHAb-Developer",
      "CSA-AAD-PRJ-Concent-SHAg-Developer"]
    }
  }
}

variable "api_gw_builtin_role_assignments" {
  type = map(object({
    principal_group_names = list(string)
  }))
  description = "Map to assign builtin roles to principals to grant access to api gateway. Key must be Builtin role names."
  default = {
    "Reader" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-ODL-Developer", "CSA-AAD-PRJ-Concent-SRPartner",
        "CSA-AAD-PRJ-Concent-SRDirect", "CSA-AAD-PRJ-Concent-Developer", "CSA-AAD-PRJ-Concent-SHAb-Developer",
      "CSA-AAD-PRJ-Concent-SHAg-Developer"]
    }
  }
}