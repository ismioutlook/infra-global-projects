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

variable "storage_container_rex_upload_folder" {
  type        = string
  description = "Name of the folder in storage container for REX upload"
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

variable "eventgrid_system_topic_name" {
  type        = string
  description = "Name of the event grid system topic"
}

variable "subnet_delegation_name" {
  type        = string
  default     = "functionapp-delegation"
  description = "Name of the subnet delegation"
}

variable "service_delegation_name" {
  type        = string
  default     = "Microsoft.Web/serverFarms"
  description = "Name of the service delegation"
}

variable "service_delegation_actions" {
  type        = list(string)
  default     = ["Microsoft.Network/virtualNetworks/subnets/action"]
  description = "Actions of the service delegation"
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

variable "eventgrid_subscription_subject_filter" {
  type        = string
  default     = "/blobServices/default/containers/${var.storage_container_name}/blobs/${var.storage_container_rex_upload_folder}"
  description = "Filter of the subject for event grid subscription"
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

