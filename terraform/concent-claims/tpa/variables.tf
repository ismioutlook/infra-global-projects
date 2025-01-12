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

# Log Analytics Workspace
variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of Log Analytics Workspace"
}

variable "log_analytics_workspace_sku" {
  type        = string
  description = "Log Analytics workspace sku"
}

variable "log_analytics_workspace_retention_in_days" {
  type        = string
  description = "Log Analytics workspace retention period"
}

# Storage Account and Container
variable "storage_account_name" {
  type        = string
  description = "Name of Storage Account Bucket"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage Account tier"
}

variable "storage_account_replication" {
  type        = string
  description = "Storage Account Replication"
}

variable "storage_container_name" {
  type        = string
  description = "Storage Account Container Name"
}

variable "storage_container_access_type" {
  type        = string
  description = "Storage Account Container Access type"
}

# Login App

variable "enabled_logicapp" {
  type        = bool
  default     = true
  description = "Flag to control provisioning of logic app"
}

variable "logic_app_name" {
  type        = string
  default     = ""
  description = "Azure Logic App name"
}

variable "app_service_plan_name" {
  type        = string
  default     = ""
  description = "App service plan name"
}

variable "app_service_plan_name_os_type" {
  type        = string
  default     = "Windows"
  description = "App service plan operating system type"
}

variable "app_service_plan_name_sku_name" {
  type        = string
  default     = "WS1"
  description = "App service plan sku name"
}

variable "logic_app_version" {
  type        = string
  default     = "~4"
  description = "Azure Logic App version"
}

# Application Insights
variable "app_insights_name" {
  type        = string
  description = "Application Insights Name"
}

variable "app_insights_type" {
  type        = string
  description = "Type of application insights"
}

# Azure Data Factory
variable "data_factory_name" {
  type        = string
  description = "Name of Azure Data Factory"
}

# Keyvault Variables
variable "key_vault_name" {
  type        = string
  description = "Key_vault name"
}

variable "soft_delete_retention_days" {
  type        = string
  description = "soft_delete_retention_days"
}

variable "kv_sku_name" {
  type        = string
  description = "Key Vault SKU"
}

variable "kv_policy_objects_ids" {
  type = object({
    reader_objects_ids = list(string)
    admin_objects_ids  = list(string)
  })
  default = {
    reader_objects_ids = []
    admin_objects_ids  = []
  }
  description = "List of Keyvault access policies"
}
