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
  description = "Tier of the storage account"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Replication type of the storage account"
}
