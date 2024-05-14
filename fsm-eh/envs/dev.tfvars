tenant_id                   = "d2007bef-127d-4591-97ac-10d72fe28031"
subscription_id             = "4731e47d-991b-4fbd-86aa-1e861607b82f"
eventhub_namespace_name     = "elxevh-fsm-eu-dev-01"
eventhub_names              = ["c4c-fsm-ticket-create-update-consumers-dev", "c4c-fsm-ticket-consumers-confirm-dev", "c4c-ticket-coverage-code-consumers-dev", "fsm-c4c-ticket-back-reporting-dev", "fsm-c4c-ticket-task-status-dev"]
consumer_group_names        = ["c4c-fsm-ticket-dev", "c4c-ticket-consumers-confirm-dev", "c4c-ticket-coverage-code-dev", "fsm-c4c-ticket-back-reporting-dev", "fsm-c4c-ticket-task-status-dev"]
resource_group_location     = "westeurope"
resource_group_name         = "RG-GL-ELX-FSM-NonProd-01"
sku                         = "Standard"
partition_count             = "8"
eventhub_namespace_capacity = "2"
auto_inflate_enabled        = true
maximum_throughput_units    = "10"
message_retention           = "7"
subnet_name                 = "AKS-SBNT-001"
vnet_name                   = "VN-ELX-GL-Concent-NonProd-Spoke-002"
vnet_rg_name                = "RG-ELX-GL-Concent-NonProd-Networking"
owner_tag                   = "Arun Nalliannan"
account_tag                 = "623065"
billingid_tag               = "Global"
costcenterit_tag            = "10350645"
sector_tag                  = "WestEurope"
env_tag                     = "Dev"
created_by_tag              = "PETeam"