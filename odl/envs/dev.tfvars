# ------------------------Keyvault Resource Group Details for EU region------------------------------
kv_resource_group_name     = "RG-ELX-GL-Concent-KeyVaults"
kv_resource_group_location = "West Europe"


#-----------------------------KeyVault----------------------
key_vault_name = "elxkv-odl-sops-eu-dev"


# ------------------------Storage account details for EU region------------------------------
resource_group_name           = "RG-GL-ODL-CORE-DEV-EU"
resource_group_location       = "West Europe"
storage_account_name          = "elxa2dlsodldev0001"
storage_account_tier          = "Standard"
storage_container_name        = "retrieved-data"
storage_container_access_type = "private"
storage_account_replication   = "LRS"
account_kind                  = "StorageV2"
is_hns_enabled                = "true"

# --------Event Grid Topics and subscriptions -------------
eventgrid_topics = {
  topic1 = {
    eventgrid_custom_topic_name = "eg-topic-odlcore-individualcustomer-entity-dev"
    eventgrid_custom_subscriptions = {
      "subscription1" = {
        name                              = "c4c-individualcustomer-webhook"
        endpoint_url                      = "https://westeurope.azure.data.mongodb-api.com/app/odl-core-eu-cdc-fplko/endpoint/cdc/IndividualCustomer"
        max_events_per_batch              = 10
        preferred_batch_size_in_kilobytes = 640
        subject_begins_with               = "IndividualCustomer.Root"
        subject_ends_with                 = ""
        case_sensitive                    = false
      }
    }
  },
  topic2 = {
    eventgrid_custom_topic_name = "eg-topic-odlcore-registeredproduct-entity-dev"
    eventgrid_custom_subscriptions = {
      "subscription1" = {
        name                              = "c4c-registeredproduct-webhook"
        endpoint_url                      = "https://westeurope.azure.data.mongodb-api.com/app/odl-core-eu-cdc-fplko/endpoint/cdc/RegisteredProduct"
        max_events_per_batch              = 10
        preferred_batch_size_in_kilobytes = 640
        subject_begins_with               = "InstallationPoint/RegisteredProduct.Root"
        subject_ends_with                 = ""
        case_sensitive                    = false
      }
    }
  }
}

mongo_prv_endpoints = {
  mongo-cdi-dev-odl-eu-001 = {
    location            = "westeurope"
    resource_group_name = "RG-ELX-GL-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/PV-ENDPOINTS-SBNT-001"
    private_service_connection = {
      name                           = "pls_6647731abef1e23ee3296de7"
      private_connection_resource_id = "/subscriptions/965414d2-425a-4f59-b691-3a65b282ee5f/resourceGroups/rg_6647731abef1e23ee3296de8_hwp575fn/providers/Microsoft.Network/privateLinkServices/pls_6647731abef1e23ee3296de7"
    }
  }
}