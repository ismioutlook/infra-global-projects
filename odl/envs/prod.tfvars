enabled                  = true
enabled_keyvault         = true
enabled_storaged_account = true
# ------------------------Keyvault Resource Group Details for EU region------------------------------
kv_resource_group_name     = "RG-ELX-GL-Concent-KeyVaults"
kv_resource_group_location = "West Europe"

#-----------------------------KeyVault----------------------
key_vault_name = "elxkv-odl-eu-prod"


# ------------------------Storage account details for EU region------------------------------
resource_group_name           = "RG-GL-ODL-CORE-PROD-EU"
resource_group_location       = "West Europe"
storage_account_name          = "elxa2dlsodlprod0001"
storage_account_tier          = "Standard"
storage_container_name        = "retrieved-data"
storage_container_access_type = "private"
storage_account_replication   = "LRS"
account_kind                  = "StorageV2"
is_hns_enabled                = "true"
resource_group_readers        = []



# --------Event Grid Topics and subscriptions -------------
eventgrid_topics = {
  topic1 = {
    eventgrid_custom_topic_name = "eg-topic-odlcore-individualcustomer-entity-prod"
    apim_named_value_name       = "odl-core-customer-eg-topic-key-prod"
    apim_backend_name           = "odl-core-customer-prod"
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
    eventgrid_custom_topic_name = "eg-topic-odlcore-registeredproduct-entity-prod"
    apim_named_value_name       = "odl-core-regproduct-eg-topic-key-prod"
    apim_backend_name           = "odl-core-registeredproduct-prod"
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
  },
  topic3 = {
    eventgrid_custom_topic_name = "eg-topic-odlcore-product-entity-prod"
    apim_named_value_name       = "odl-core-product-eg-topic-key-prod"
    apim_backend_name           = "odl-core-product-prod"
    eventgrid_custom_subscriptions = {
      "subscription1" = {
        name                              = "c4c-product-webhook"
        endpoint_url                      = "https://westeurope.azure.data.mongodb-api.com/app/odl-core-eu-cdc-pzpjr/endpoint/cdc/Product"
        max_events_per_batch              = 10
        preferred_batch_size_in_kilobytes = 640
        subject_begins_with               = "product.Root"
        subject_ends_with                 = ""
        case_sensitive                    = false
      }
    }
  }
}

#---- private endpoints for PROD environment to Mongo atlas

mongo_prv_endpoints = {
  mongo-cdi-prod-aks-us-001 = {
    location            = "eastus"
    resource_group_name = "RG-ELX-EUS-Concent-Prod-Networking"
    subnet_id           = "/subscriptions/9a44d85a-3cf1-4938-9509-c8f94b1aee10/resourceGroups/RG-ELX-EUS-Concent-Prod-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-Prod-Spoke-001/subnets/PV-ENDPOINTS-SBT-01"
    private_service_connection = {
      name                           = "pls_66697b0fd69e175b9340f867"
      private_connection_resource_id = "/subscriptions/965414d2-425a-4f59-b691-3a65b282ee5f/resourceGroups/rg_666978003bd93f7004e79ece_xietjuez/providers/Microsoft.Network/privateLinkServices/pls_66697b0fd69e175b9340f867"
    }
  },
  mongo-cdi-prod-aks-eu-001 = {
    location            = "westeurope"
    resource_group_name = "RG-ELX-EU-Concent-Prod-Networking"
    subnet_id           = "/subscriptions/9a44d85a-3cf1-4938-9509-c8f94b1aee10/resourceGroups/RG-ELX-EU-Concent-Prod-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EU-Concent-Prod-Spoke-001/subnets/PV-ENDPOINTS-SBNT-001"
    private_service_connection = {
      name                           = "pls_6672d8c2e151d92e2fa15264"
      private_connection_resource_id = "/subscriptions/98efe96e-b65d-42f4-be9b-d9aebc2bc619/resourceGroups/rg_6672cf8e5412a11fcc6c4f6f_2wuj2s2x/providers/Microsoft.Network/privateLinkServices/pls_6672d8c2e151d92e2fa15264"
    }
  }
}


reader_and_data_access_grantees = ["CSA-AAD-PRJ-Concent-ODL-Developer"]

api_management_srv_details = {
  name                = "elxapimglprod-01"
  resource_group_name = "RG-GL-ELX-EU-Prod-01"
}
