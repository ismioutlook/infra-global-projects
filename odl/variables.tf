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

variable "kv_resource_group_name" {
  type        = string
  description = "Name of the resource group for Keyvault"
}

variable "kv_resource_group_location" {
  type        = string
  description = "Location of the resource group for Keyvault"
}


#---Keyvault  -----

variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
}
variable "soft_delete_retention_days" {
  type        = string
  description = "kv soft delete retention days"
}
variable "kv_sku_name" {
  type        = string
  description = "key vault sku name"
}

#--- Keyvault keys
variable "kv_keys" {
  type        = list(string)
  description = "key vault sku name"
}
