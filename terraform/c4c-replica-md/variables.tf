variable "enabled" {
  type        = bool
  default     = true
  description = "Global flag to control resource provisioning"
}

variable "adf_name" {
  type        = string
  description = "ADF name"
}

variable "azure_devops_configuration" {
  type        = map(string)
  description = "azure devops organization"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to provision"
}

variable "location" {
  type        = string
  description = "Location of resource"
}

variable "ignore_tags_changes" {
  type        = bool
  default     = true
  description = "Flag to ignore resource group tag changes"
}
### windows machine ###
variable "machine_name" {
  type        = string
  description = "server name"
}
variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}
### SQL DB ##
variable "sql_srv_name" {
  type        = string
  description = "SQL server name"
}

variable "sql_db_name" {
  type        = string
  description = "SQL database name"
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