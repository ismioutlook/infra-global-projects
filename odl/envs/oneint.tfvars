# ------------------------Keyvault Resource Group Details for EU region------------------------------
kv_resource_group_name     = "RG-ELX-GL-Concent-KeyVaults"
kv_resource_group_location = "West Europe"


#-----------------------------KeyVault----------------------
key_vault_name = "elxkv-odl-sops-eu-1int"


# ------------------------Storage account details for EU region------------------------------
resource_group_name           = "RG-GL-ODL-CORE-1INT-EU"
resource_group_location       = "West Europe"
storage_account_name          = "elxa2dlsodl1int0001"
storage_account_tier          = "Standard"
storage_container_name        = "retrieved-data"
storage_container_access_type = "private"
storage_account_replication   = "LRS"
account_kind                  = "StorageV2"
is_hns_enabled                = "true"

# --------Event Grid Topics and subscriptions -------------
eventgrid_topics = {
  topic1 = {
    eventgrid_custom_topic_name = "eg-topic-odlcore-individualcustomer-entity-oneint"
    eventgrid_custom_subscriptions = {
      "subscription1" = {
        name                              = "c4c-individualcustomer-webhook"
        endpoint_url                      = "https://westeurope.azure.data.mongodb-api.com/app/odl-core-eu-cdc-pzpjr/endpoint/cdc/IndividualCustomer"
        max_events_per_batch              = 10
        preferred_batch_size_in_kilobytes = 640
        subject_begins_with               = "IndividualCustomer.Root"
        subject_ends_with                 = ""
        case_sensitive                    = false
      }
    }
  },
  topic2 = {
    eventgrid_custom_topic_name = "eg-topic-odlcore-registeredproduct-entity-oneint"
    eventgrid_custom_subscriptions = {
      "subscription1" = {
        name                              = "c4c-registeredproduct-webhook"
        endpoint_url                      = "https://westeurope.azure.data.mongodb-api.com/app/odl-core-eu-cdc-pzpjr/endpoint/cdc/RegisteredProduct"
        max_events_per_batch              = 10
        preferred_batch_size_in_kilobytes = 640
        subject_begins_with               = "InstallationPoint/RegisteredProduct.Root"
        subject_ends_with                 = ""
        case_sensitive                    = false
      }
    }
  }
}

#---- private endpoints for One-integration environment to Mongo atlas
mongo_prv_endpoints = {
  mongo-cdi-oneintegration-odl-eu-001 = {
    location            = "westeurope"
    resource_group_name = "RG-ELX-GL-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/PV-ENDPOINTS-SBNT-001"
    private_service_connection = {
      name                           = "pls_6647a24f29900a74737f044f"
      private_connection_resource_id = "/subscriptions/f676eba7-0e22-4044-936f-7a2e155d0844/resourceGroups/rg_6647a24f29900a74737f0451_xhrhitre/providers/Microsoft.Network/privateLinkServices/pls_6647a24f29900a74737f044f"
    }
  },
  mongo-cdi-oneintegration-odl-na-001 = {
    location            = "eastus"
    resource_group_name = "RG-ELX-EUS-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-EUS-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-NonProd-Spoke-001/subnets/PV-ENDPOINTS-SBT-01"
    private_service_connection = {
      name                           = "pls_6647991b117eaf178b266846"
      private_connection_resource_id = "/subscriptions/f49c0d40-a892-48ac-a415-48e0e0481718/resourceGroups/rg_66265222295e422857b5259f_n19oy1wm/providers/Microsoft.Network/privateLinkServices/pls_6647991b117eaf178b266846"
    }
  },
  mongo-odl-core-qa-eu-001 = {
    location            = "westeurope"
    resource_group_name = "RG-ELX-GL-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/PV-ENDPOINTS-SBNT-001"
    private_service_connection = {
      name                           = "pls_664afc008a2a3a707eb7b58a"
      private_connection_resource_id = "/subscriptions/7cdc43bc-4dae-46fc-acdb-a56ecd1c0571/resourceGroups/rg_659ffe4dcb7ef44fb0c81a6a_jvikcila/providers/Microsoft.Network/privateLinkServices/pls_664afc008a2a3a707eb7b58a"
    }
  }
}
