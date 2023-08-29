variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network this Subnet is located within"
}

variable "subnet_name" {
  type        = list(string)
  description = "Name of the Subnet"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "vnet address space range details"
  #default = "10.216.0.0/16"
}

variable "subnet_address_space" {
  type        = list(string)
  description = "subnet address space range details"
  #default = "10.216.0.0/24"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist."
}

variable "service_endpoints" {
  type        = list(string)
  description = "mentioned service endpoints which needs to be enabled with subnet"
}

variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
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