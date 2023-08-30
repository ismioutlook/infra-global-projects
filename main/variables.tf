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