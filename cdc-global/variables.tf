variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "resource_group_location" {
  description = "Location of resources"
  type        = string
}

#EventHub Details 

variable "eventhub_namespace_name" {
  description = "The name of the Event Hub namespace"
  type        = string
}

variable "eventhub_names" {
  type = map(object({
    name                 = string
    consumer_group_names = list(string)
  }))
  default = {}
}

variable "eventhub_namespace_capacity" {
  description = "Event Hub Name Space Capacity"
  type        = number
}

variable "auto_inflate_enabled" {
  description = "Event Hub auto_inflate_enabled value"
  type        = bool
}

variable "maximum_throughput_units" {
  description = "Event Hub auto_inflate maximum_throughput_units"
  type        = number
}

variable "sku" {
  description = "The SKU for the Event Hub namespace"
  type        = string

}

variable "partition_count" {
  description = "The number of partitions for each Event Hub"
  type        = number

}

variable "message_retention" {
  description = "The retention period for messages in days"
  type        = number
}

variable "tags" {
  description = "tags for the resource"
  type = object({
    env_tag          = string
    owner_tag        = string
    account_tag      = string
    billingid_tag    = string
    costcenterit_tag = string
    sector_tag       = string
    created_by_tag   = string
  })
}

# # ----- provider values ---
variable "tenant_id" {
  type        = string
  description = "tenant id"
}

variable "subscription_id" {
  type        = string
  description = "subscription id"
}
