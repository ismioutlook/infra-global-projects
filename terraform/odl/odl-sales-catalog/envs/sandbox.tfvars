enabled_keyvault                    = true
key_vault_name                      = "sc-mongodb-constr3-sndbx"
key_vault_secret_name               = "sc-mongodb-odl-core-dev-eu-pe-conn-str"
keyvault_id                         = "/subscriptions/f28071b5-e402-4c1a-83cc-ed0744ce8e0a/resourceGroups/RG-EMEA-DDL-Sandbox/providers/Microsoft.KeyVault/vaults/sc-mongodb-constr3-sndbx"
resource_group_name                 = "RG-EMEA-DDL-Sandbox"
resource_group_location             = "westeurope"
storage_account_name                = "elxnsscsandbox"
storage_account_name_rex            = "elxnsrexupsandbox"
storage_container_name_rex          = "salescatalogupload"
storage_container_rex_upload_folder = "CT-REX-ODL-LANDING"
application_insights_name           = "sc-rex-process-tracking"
application_insights_type           = "web"
function_app_name                   = "func-sales-catalog-sandbox-westeu"

function_app_plan = {
  name     = "ASP-RGEMEADDLSandbox-a17e"
  sku_name = "B1"
}

provision_subnet = true

subnet_details = {
  name                = "odl-sales-catalog-ingestion-vnet-subnet"
  resource_group_name = "RG-EMEA-DDL-Sandbox"
  vnet_name           = "VN-DDL-POC"
  address_prefixes    = ["10.0.2.16/29"]
  delegation = {
    name = "functionapp-delegation"
    service_delegation = {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

eventgrid_system_topic_name                   = "eg-s-topic-sales-catalog-ingestion"
eventgrid_subscription_name                   = "sbsc-sales-catalog-ingestion"
eventgrid_subscription_advanced_filter_values = ["rex-"]
eventgrid_custom_topic_name                   = "eg-c-topic-sales-catalog-ingestion"
