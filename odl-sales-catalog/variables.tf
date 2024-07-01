variable "enabled" {
  type        = bool
  default     = true
  description = "Global flag to control resource provisioning"
}

variable "enabled_keyvault" {
  type        = bool
  default     = false
  description = "Flag to control provisioning of keyvault"
}

variable "enabled_eventgrid_event_subscription_storageaccount" {
  type        = bool
  default     = true
  description = "Flag to control provisioning of eventgrid_event_subscription_storageaccount"
}

variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
}

variable "key_vault_secret_name" {
  type        = string
  description = "Name of the Azure Key Vault secret"
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

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to provision"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "resource_group_builtin_role_assignments" {
  type = map(object({
    principal_group_names = list(string)
  }))
  description = "Map to assign builtin roles to principals. Key must be Builtin role names."
  default     = {}
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account to be used for func app. If left empty, it will be generated"
  default     = null
}

variable "storage_account_name_rex" {
  type        = string
  description = "Name of the REX upload storage account"
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

variable "storage_container_name_rex" {
  type        = string
  description = "Name of the REX upload storage container"
}

variable "storage_container_access_type" {
  type        = string
  default     = "private"
  description = "Access type of the storage container"
}

variable "storage_container_rex_upload_folder" {
  type        = string
  description = "Name of the folder in storage container for REX upload"
}

variable "storage_account_builtin_role_assignments" {
  type = map(object({
    principal_group_names = list(string)
  }))
  description = "Map to assign builtin storage account roles to principals. Key must be Builtin role names."
  default     = {}
}

variable "enabled_application_insights" {
  type        = bool
  default     = true
  description = "Flag to control provisioning of application insights"
}

variable "application_insights_name" {
  type        = string
  description = "Name of the application insights"
  default     = null
}

variable "application_insights_type" {
  type        = string
  default     = "web"
  description = "Type of the application insights"
}

variable "app_insights_builtin_role_assignments" {
  type = map(object({
    principal_group_names = list(string)
  }))
  description = "Map to assign builtin roles to principals to grant access to app insights. Key must be Builtin role names."
  default = {
    "Monitoring Reader" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-ODL-Developer"]
    }
  }
}

variable "function_app_name" {
  type        = string
  description = "Name of the function app"
}

variable "function_app_plan" {
  type = object({
    name     = string
    sku_name = string
  })
  description = "Name of the function app service plan to provision. If left, empty a name will be generated"
  default     = null
}

variable "function_app_subnet_details" {
  type = object({
    subnet_name         = string
    vnet_name           = string
    resource_group_name = string
  })
  default = null
}

variable "provision_subnet" {
  type        = bool
  description = "Flag to control subnet provisioning. If true, subnet_details variable must be provided"
  default     = false
}

variable "subnet_details" {
  type = object({
    name                = string
    resource_group_name = string
    vnet_name           = string
    address_prefixes    = list(string)
    delegation = object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    })
  })
  default = null
}

variable "eventgrid_system_topic_name" {
  type        = string
  description = "Name of the event grid system topic"
}

variable "eventgrid_custom_topic_name" {
  type        = string
  description = "Name of the event grid custom topic"
}

variable "eg_topic_type" {
  type        = string
  default     = "Microsoft.Storage.StorageAccounts"
  description = "Type of the event grid topic"
}

variable "eventgrid_subscription_name" {
  type        = string
  default     = "Microsoft.Storage.StorageAccounts"
  description = "Name of the event grid subscription"
}

variable "eventgrid_subscription_suffix_filter" {
  type        = string
  default     = ".csv"
  description = "Filter of the subject for event grid subscription"
}

variable "eventgrid_subscription_advanced_filter_key" {
  type        = string
  default     = "subject"
  description = "Key of advanced filter for event grid subscription"
}

variable "eventgrid_subscription_advanced_filter_values" {
  type        = list(string)
  description = "Values of advanced filter for event grid subscription"
}

variable "eventgrid_subscription_event_delivery_schema" {
  type        = string
  default     = "EventGridSchema"
  description = "Schema of event delivery for event grid subscription"
}

