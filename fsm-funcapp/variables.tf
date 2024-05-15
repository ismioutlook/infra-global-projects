#############################################################################
# Resource Group

variable "resource_group_name" {
  type        = string
  description = "The Name which should be used for this Resource Group"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist."
}


#############################################################################
# Storage

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

# ----- provider values ---
variable "tenant_id" {
  type = string
  #default     = "d2007bef-127d-4591-97ac-10d72fe28031"
  description = "tenant id"
}

variable "subscription_id" {
  type = string
  #default     = "7d5c4638-bc97-49ff-9e82-e4ff06d6b7c7"
  description = "subscription id"
}

# ------ TAGS ----
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

#################### Function App #######################
variable "function_app_name" {
  type        = list(string)
  description = "List of function apps to create"
}

variable "function_app_os" {
  type        = string
  description = "Operating System used by the functions"
}

variable "function_app_plan_name" {
  type        = list(string)
  description = "Name of the Function App Plan"

}

variable "function_app_run_time" {
  type        = string
  description = "run time stack"
}


variable "function_app_plan_sku_size" {
  type        = string
  description = "Plan Size"
}
