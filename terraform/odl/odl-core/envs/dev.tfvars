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
    apim_named_value_name       = "odl-core-customer-eg-topic-key-dev"
    apim_backend_name           = "odl-core-customer-dev"
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
    apim_named_value_name       = "odl-core-regproduct-eg-topic-key-dev"
    apim_backend_name           = "odl-core-registeredproduct-dev"
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
  },
  topic3 = {
    eventgrid_custom_topic_name = "eg-topic-odlcore-product-entity-dev"
    apim_named_value_name       = "odl-core-product-eg-topic-key-dev"
    apim_backend_name           = "odl-core-product-dev"
    eventgrid_custom_subscriptions = {
      "subscription1" = {
        name                              = "c4c-product-webhook"
        endpoint_url                      = "https://westeurope.azure.data.mongodb-api.com/app/odl-core-eu-cdc-fplko/endpoint/cdc/Product"
        max_events_per_batch              = 10
        preferred_batch_size_in_kilobytes = 640
        subject_begins_with               = "Material.Root"
        subject_ends_with                 = ""
        case_sensitive                    = false
      }
    }
  }
}

#---- private endpoints for One-integration environment to Mongo atlas

mongo_prv_endpoints = {
  mongo-odl-dev-aks-eu-001 = {
    location            = "westeurope"
    resource_group_name = "RG-ELX-GL-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/PV-ENDPOINTS-SBNT-001"
    private_service_connection = {
      name                           = "pls_64d5d8dfb915977f56e3d881"
      private_connection_resource_id = "/subscriptions/19e802a2-d3c8-4249-9597-304977d635f9/resourceGroups/rg_621766044229b71a1a195fd3_whcma0ga/providers/Microsoft.Network/privateLinkServices/pls_64d5d8dfb915977f56e3d881"
    }
  },
  mongo-cdi-dev-aks-eu-001 = {
    location            = "westeurope"
    resource_group_name = "RG-ELX-GL-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/PV-ENDPOINTS-SBNT-001"
    private_service_connection = {
      name                           = "pls_664b1c017ed05154ceb70daa"
      private_connection_resource_id = "/subscriptions/965414d2-425a-4f59-b691-3a65b282ee5f/resourceGroups/rg_6647731abef1e23ee3296de8_sjuks3oy/providers/Microsoft.Network/privateLinkServices/pls_664b1c017ed05154ceb70daa"
    }
  },
  mongo-odl-core-dev-eu-aks-001 = {
    location            = "westeurope"
    resource_group_name = "RG-ELX-GL-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/PV-ENDPOINTS-SBNT-001"
    private_service_connection = {
      name                           = "pls_65e9bba49813f7051adef719"
      private_connection_resource_id = "/subscriptions/226dc952-30bd-4cb3-ac24-a11e3eac1a25/resourceGroups/rg_64f5a53e03b3e9784c235bac_rlndpd8f/providers/Microsoft.Network/privateLinkServices/pls_65e9bba49813f7051adef719"
    }
  },
  mongo-cdi-dev-aks-na-001 = {
    location            = "eastus"
    resource_group_name = "RG-ELX-EUS-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-EUS-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-NonProd-Spoke-001/subnets/PV-ENDPOINTS-SBT-01"
    private_service_connection = {
      name                           = "pls_664b1f5349a7a7372f74d684"
      private_connection_resource_id = "/subscriptions/4c3b0233-bcee-4451-82c0-eeb957599ad7/resourceGroups/rg_66479ddda25de05566de5fd4_tb3a3mry/providers/Microsoft.Network/privateLinkServices/pls_664b1f5349a7a7372f74d684"
    }
  },
  mongo-development-aks-na-001 = {
    location            = "eastus"
    resource_group_name = "RG-ELX-EUS-Concent-NonProd-Networking"
    subnet_id           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-EUS-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-NonProd-Spoke-001/subnets/PV-ENDPOINTS-SBT-01"
    private_service_connection = {
      name                           = "pls_664b205abf4e0c4529cde61a"
      private_connection_resource_id = "/subscriptions/a21f6ec0-ce24-4dc4-a6d9-0d7a9f6aa47a/resourceGroups/rg_65e091cd3eb8bd628056b1ce_w00jdjyf/providers/Microsoft.Network/privateLinkServices/pls_664b205abf4e0c4529cde61a"
    }
  }
}

reader_and_data_access_grantees = ["CSA-AAD-PRJ-Concent-ODL-Developer"]

api_management_srv_details = {
  name                = "elxapimglnonprod01"
  resource_group_name = "RG-GL-ELX-EU-NonProd-01"
}

sales_catalog_func_app = {
  name           = "func-sales-catalog-dev-eastus"
  resource_group = "RG-GL-ODL-SALES-CATLOG-DEV-NA"
}