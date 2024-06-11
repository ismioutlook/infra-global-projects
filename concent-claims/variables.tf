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
variable "logic_app_name" {
  type        = string
  description = "Azure Logic App name"
}

variable "logic_app_type" {
  type        = string
  description = "Logic App type"
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

variable "app_service_plan_name" {
  type        = string
  description = "Azure App service plan name"
}

variable "app_kind" {
  type        = string
  description = "Azure App service plan name"
  #default = "elastic"
}

variable "app_tier" {
  type        = string
  description = "app_tier"
  #default = "WorkflowStandard"
}

variable "app_size" {
  type        = string
  description = "app_size"
  #default = "WS2"
}

variable "azurerm_application_insights" "appinsight" {
  type        = string
  description = "azurerm_application_insights"
  #default = "WS2"
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
