tenant_id                   = "d2007bef-127d-4591-97ac-10d72fe28031"
subscription_id             = "4731e47d-991b-4fbd-86aa-1e861607b82f"
eventhub_namespace_name     = "elxevh-cdc-global-dev-01"
resource_group_location     = "westeurope"
resource_group_name         = "RG-GL-ELX-CDC-NonProd-01"
sku                         = "Standard"
partition_count             = "8"
eventhub_namespace_capacity = "2"
auto_inflate_enabled        = true
maximum_throughput_units    = "10"
message_retention           = "7"
eventhub_names = {
  topic1 = {
    name                 = "c4c-global-consumers-dev",
    consumer_group_names = ["cg-c4c-global-consumers-dev"]
  },
  topic2 = {
    name                 = "cdc-global-consumers-dev",
    consumer_group_names = ["cg-cdc-global-consumers-dev", "cg-cdc-global-datalake-dev", "cg-cdc-ymkt-global-dev"]
  },
  topic3 = {
    name                 = "cdc-event-global-consumers-dev",
    consumer_group_names = ["cg-blueconic-dev"]
  }

}
tags = {
  owner_tag        = "Arun Nalliannan"
  account_tag      = "623065"
  billingid_tag    = "Global"
  costcenterit_tag = "10350645"
  sector_tag       = "WestEurope"
  env_tag          = "Dev"
  created_by_tag   = "PETeam"
}