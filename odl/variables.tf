#---Storage account ADLS  -----
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}


variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}


variable "storage_account_tier" {
  description = "Storage account tier"
  #default     = "Standard"
  type = string
}

variable "storage_account_replication" {
  description = "Storage account tier"
  #default     = "GRS"
  type = string
}


variable "account_kind" {
  description = "Storage account kind"
  type        = string
}

variable "is_hns_enabled" {
  description = "Storage is hns enabled"
  type        = string
}


variable "enabled" {
  type        = bool
  default     = true
  description = "Global flag to control resource provisioning"
}

#---Keyvault  -----
variable "kv_resource_group_name" {
  type        = string
  description = "Name of the resource group for Keyvault"
}

variable "kv_resource_group_location" {
  type        = string
  description = "Location of the resource group for Keyvault"
}



variable "enabled_keyvault" {
  type        = bool
  default     = true
  description = "Flag to control provisioning of keyvault"
}

variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
}
variable "soft_delete_retention_days" {
  type        = string
  description = "kv soft delete retention days"
  default     = "90"
}
variable "kv_sku_name" {
  type        = string
  description = "key vault sku name"
  default     = "standard"
}
