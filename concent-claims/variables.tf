variable "enabled" {
  type        = bool
  default     = false
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

#----------------------------Log Analytics Workspace--------------------------------------
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
#----------------------------Storage Account and Container-----------------------------------------


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
  description = "Storage Account Repliaction"
}

variable "storage_container_name" {
  type        = string
  description = "Storage Account Container Name"
}

variable "storage_container_access_type" {
  type        = string
  description = "Storage Account Container Access type"
}

#---------Application Insights------------
variable "app_insights_name" {
  type        = string
  description = "Application Insights Name"
}

variable "app_insights_type" {
  type        = string
  description = "Type of application insights"
}


#-----------Azure Data Factory-------------

variable "data_factory_name" {
  type        = string
  description = "Name of Azure Data Factory"
}
# ----- provider values ---
variable "tenant_id" {
  type        = string
  description = "tenant id"
}

variable "subscription_id" {
  type        = string
  description = "subscription id"
}