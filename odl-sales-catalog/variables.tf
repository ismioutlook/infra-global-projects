variable "enabled" {
  type        = bool
  default     = true
  description = "Global flag to control resource provisioning"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to provision"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "storage_account_tier" {
  type        = string
  default     = "Standard"
  description = "Tier of the storage account"
}

variable "storage_account_replication_type" {
  type        = string
  default     = "RAGRS"
  description = "Replication type of the storage account"
}

variable "storage_container_name" {
  type        = string
  description = "Name of the storage container"
}

variable "storage_container_access_type" {
  type        = string
  default     = "private"
  description = "Access type of the storage container"
}

variable "service_plan_name" {
  type        = string
  description = "Name of the service plan"
}

variable "function_app_name" {
  type        = string
  description = "Name of the function app"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the VNet"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_cidrs" {
  type        = list(any)
  description = "CIDR range of the subnet"
}


