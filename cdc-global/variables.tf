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

# variable "eventhub_names" {
#   description = "A list of Event Hub names"
#   type        = list(string)
# }

# variable "consumer_group_names" {
#   description = "A list of Consumer Group names"
#   type        = list(string)
# }

variable "eventhub_names" {
  type = map(object({
    name                 = string
    consumer_group_names = list(string)
  }))
  default = {}
}

variable "eventhub_namespace_capacity" {
  description = "Event Hub Name Space Capacity"
  #default     = 2
  type = number
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
  #default     = "Standard"
}

variable "partition_count" {
  description = "The number of partitions for each Event Hub"
  type        = number
  #default     = 2
}

variable "message_retention" {
  description = "The retention period for messages in days"
  type        = number
}

# variable "subnet_name" {
#   type        = string
#   description = "manage subnet name for eventhub namespace"
# }

# variable "vnet_name" {
#   type        = string
#   description = "manage vnet name for eventhub namespace"
# }

# variable "vnet_rg_name" {
#   type        = string
#   description = "subnet and vnet rg name"
# }

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
# # ------ TAGS ----
# variable "owner_tag" {
#   type = string
#   #default     = "Arun Nalliannan"
#   description = "Owner of the resource"
# }

# variable "account_tag" {
#   type = string
#   #default     = "623065"
#   description = "Account"
# }

# variable "billingid_tag" {
#   type = string
#   #default     = "MyAccounts"
#   description = "Billing ID"
# }

# variable "costcenterit_tag" {
#   type = string
#   #default     = "10350645"
#   description = "Cost Center"
# }

# variable "sector_tag" {
#   type = string
#   #default     = "BAEurope"
#   description = "Sector"
# }

# variable "env_tag" {
#   type = string
#   #default     = "DEV"
#   description = "Environment used in the tags of the resources"
# }

# variable "created_by_tag" {
#   type = string
#   #default     = "PETeam"
#   description = "mention created by tag"
# }

# # ----- provider values ---
variable "tenant_id" {
  type        = string
  description = "tenant id"
}

variable "subscription_id" {
  type        = string
  description = "subscription id"
}
