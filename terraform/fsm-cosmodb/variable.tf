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
# Cosmos DB (CDB)

variable "cosmosdb_account_name" {
  type        = string
  description = "Name of the cosmosdb account"
}

variable "cosmosdb_offer_type" {
  type        = string
  description = "cosmosdb account offertype"
  #default = "Standard"
}

variable "cosmosdb_account_kind" {
  type        = string
  description = "cosmosdb account kind name"
  #default = "MongoDB"
}

variable "geo_location" {
  type        = string
  description = "Geo location for CosmosDB"
}

variable "consistency_level" {
  type        = string
  description = "Consistency level for the data"
}

variable "max_interval_in_seconds" {
  type        = number
  description = "Max interval in seconds for Data consistency"
}

variable "max_staleness_prefix" {
  type        = number
  description = "Max Staleness for Data consistency"
}

variable "sql_database_name" {
  type        = string
  description = "SQL database name"
}

variable "throughput" {
  type        = number
  description = "Throughput for the SQL"
}

variable "sql_container_name" {
  type        = list(string)
  description = "SQL Container name"
}

# ------ TAGS ----

variable "owner_tag" {
  type = string
  #default    = "Arun Nalliannan"
  description = "Owner of the resource"
}

variable "account_tag" {
  type = string
  #default    = "623065"
  description = "Account"
}


variable "billingid_tag" {
  type = string
  #default    = "MyAccounts"
  description = "Billing ID"
}

variable "costcenterit_tag" {
  type = string
  #default    = "10350645"
  description = "Cost Center"
}

variable "sector_tag" {
  type = string
  #default    = "BAEurope"
  description = "Sector"
}

variable "env_tag" {
  type = string
  #default    = "DEV"
  description = "Environment used in the tags of the resources"
}


# ----- provider values ---
variable "tenant_id" {
  type = string
  #default    = "d2007bef-127d-4591-97ac-10d72fe28031"
  description = "tenant id"
}

variable "subscription_id" {
  type = string
  #default    = "7d5c4638-bc97-49ff-9e82-e4ff06d6b7c7"
  description = "subscription id"
}