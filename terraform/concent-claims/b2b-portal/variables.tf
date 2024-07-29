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

variable "ignore_tags_changes" {
  type        = bool
  default     = true
  description = "Flag to ignore resource group tag changes"
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

# Logic App
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
  default     = "WS2"
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

variable "enable_telemetry" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see https://aka.ms/avm/telemetryinfo.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "kv_sku_name" {
  type        = string
  description = "Key Vault SKU"
}

variable "kv_role_assignments" {
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default     = {}
  description = <<DESCRIPTION
A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - The condition which will be used to scope the role assignment.
- `condition_version` - The version of the condition syntax. If you are using a condition, valid values are '2.0'.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.
DESCRIPTION
  nullable    = false
}