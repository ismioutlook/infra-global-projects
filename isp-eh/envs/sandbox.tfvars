enabled                     = true
tenant_id                   = "d2007bef-127d-4591-97ac-10d72fe28031"
subscription_id             = "f28071b5-e402-4c1a-83cc-ed0744ce8e0a"
eventhub_namespace_name     = "elxevh-isp-sandbox-01"
resource_group_location     = "westeurope"
resource_group_name         = "RG-Elx-ISP-Sandbox-01"
sku                         = "Standard"
partition_count             = "1"
eventhub_namespace_capacity = "1"
auto_inflate_enabled        = true
maximum_throughput_units    = "4"
message_retention           = "7"
eventhub_names = {
  topic1 = {
    name                 = "ticketupdatestpa-tickets-sandbox",
    consumer_group_names = ["cg-ticketupdatestpa-tickets-sandbox"]
  }
}
tags = {
  owner_tag        = "Arun Nalliannan"
  account_tag      = "623065"
  billingid_tag    = "Global"
  costcenterit_tag = "10350645"
  sector_tag       = "WestEurope"
  env_tag          = "Sandbox"
  created_by_tag   = "PETeam"
}