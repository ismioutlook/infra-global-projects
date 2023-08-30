#-----------------------------resource group module variables-----------------------------------------

variable "resource_group_name_eu" {
  type        = string
  description = "Name of the resource group in the EU region."
}

variable "resource_group_location_eu" {
  type        = string
  description = "Location of the resource group in the EU region."
}

variable "resource_group_location_us" {
  type        = string
  description = "Location of the resource group in the US region."
}

variable "resource_group_name_us" {
  type        = string
  description = "Name of the resource group in the US region."
}

variable "resource_group_location_au" {
  type        = string
  description = "Location of the resource group in the Australia region."
}

variable "resource_group_name_au" {
  type        = string
  description = "Name of the resource group in the Australia region."
}

#-----------------------------Virtual Network module variables-----------------------------------------
variable "virtual_network_name_eu" {
  type        = string
  description = "Name of the virtual network in the EU region."
}

variable "virtual_network_name_us" {
  type        = string
  description = "Name of the virtual network in the US region."
}

variable "virtual_network_name_au" {
  type        = string
  description = "Name of the virtual network in the Australia region."
}

variable "vnet_address_space_eu" {
  type        = list(string)
  description = "Address space of the virtual network in the EU region."
}

variable "vnet_address_space_us" {
  type        = list(string)
  description = "Address space of the virtual network in the US region."
}

variable "vnet_address_space_au" {
  type        = list(string)
  description = "Address space of the virtual network in the Australia region."
}

variable "subnet_name" {
  type        = list(string)
  description = "Name of the subnet."
}

variable "subnet_address_space_eu" {
  type        = list(string)
  description = "Address space of the subnet in the EU region."
}

variable "subnet_address_space_us" {
  type        = list(string)
  description = "Address space of the subnet in the US region."
}

variable "subnet_address_space_au" {
  type        = list(string)
  description = "Address space of the subnet in the Australia region."
}

variable "service_endpoints" {
  type        = list(string)
  description = "List of service endpoints."
}


#--------------------------------------Traffic Manager--------------------------------------------------


variable "traffic_manager_name" {
  type        = string
  description = "Name of the Traffic Manager."
}

variable "traffic_routing_method" {
  type        = string
  description = "Traffic routing method for the Traffic Manager."
}

variable "ttl_value" {
  type        = number
  description = "TTL value for DNS records."
}

variable "protocol" {
  type        = string
  description = "Protocol for health checks."
}

variable "port" {
  type        = number
  description = "Port number for health checks."
}

variable "path" {
  type        = string
  description = "Path for health checks."
}

variable "interval_in_seconds" {
  type        = number
  description = "Interval between health checks in seconds."
}

variable "timeout_in_seconds" {
  type        = number
  description = "Timeout for health checks in seconds."
}

variable "tolerated_number_of_failures" {
  type        = number
  description = "Number of tolerated failures for health checks."
}

# Azure Subscription 
variable "tenant_id" {
  type        = string
  description = "Tenant id"
  default     = "d2007bef-127d-4591-97ac-10d72fe28031"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = "f28071b5-e402-4c1a-83cc-ed0744ce8e0a"
}

#----------------------------Application Gateway-------------------------------------------
variable "appgw_pip_name" {
  type        = string
  description = "Name of the Application Gateway public IP."
}

variable "appgw_pip_allocation" {
  type        = string
  description = "Allocation method for the Application Gateway public IP."
}

variable "appgw_name" {
  type        = string
  description = "Name of the Application Gateway."
}

variable "appgw_sku_name" {
  type        = string
  description = "Name of the Application Gateway SKU."
}

variable "appgw_sku_tier" {
  type        = string
  description = "Tier of the Application Gateway SKU."
}

variable "appgw_sku_capacity" {
  type        = number
  description = "Capacity of the Application Gateway SKU."
}

variable "appgw_ip_config_name" {
  type        = string
  description = "Name of the Application Gateway IP configuration."
}

# variable "subnet_id" {
#   type        = string
#   description = "ID of the subnet for the Application Gateway IP configuration."
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
#-----------------------------------------------------Tags--------------------------------------------------------
variable "owner_tag" {
  type = string
  #default     = "Arun Nalliannan"
  description = "Owner of the resource"
}

variable "account_tag" {
  type = string
  #default     = "623065"
  description = "Account"
}

variable "billingid_tag" {
  type = string
  #default     = "MyAccounts"
  description = "Billing ID"
}

variable "costcenterit_tag" {
  type = string
  #default     = "10350645"
  description = "Cost Center"
}

variable "sector_tag" {
  type = string
  #default     = "BAEurope"
  description = "Sector"
}

variable "env_tag" {
  type = string
  #default     = "DEV"
  description = "Environment used in the tags of the resources"
}

variable "created_by_tag" {
  type = string
  #default     = "PETeam"
  description = "mention created by tag"
}