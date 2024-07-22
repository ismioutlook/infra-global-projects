key_vault_name          = "elxkv-odl-sops-eu-oneint"
key_vault_secret_name   = "mongodb-az-oneint-odl-na-01-conn-str"
keyvault_id             = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-KeyVaults/providers/Microsoft.KeyVault/vaults/elxkv-odl-sops-eu-1int"
resource_group_name     = "RG-GL-ODL-SALES-CATLOG-ONEINT-NA"
resource_group_location = "eastus"
resource_group_builtin_role_assignments = {
  "Reader" = {
    principal_group_names = ["CSA-AAD-PRJ-Concent-ODL-Developer"]
  }
}
storage_account_name_rex            = "elxnsrexuponeint001"
storage_container_name_rex          = "salescatalogupload"
storage_container_rex_upload_folder = "CT-REX-ODL-LANDING"
storage_account_builtin_role_assignments = {
  "Storage Blob Data Contributor" = {
    principal_group_names = ["CSA-AAD-PRJ-Concent-ODL-Developer"]
  }
}

storage_account_name      = "elxnssalescatalog1int001"
application_insights_name = "sc-rex-process-tracking-oneint"
application_insights_type = "web"

function_app_plan = {
  name     = "aspus-sales-catalog-oneint-eastus001"
  sku_name = "B1"
}

function_app_name = "func-sales-catalog-oneint-eastus"
function_app_subnet_details = {
  subnet_name         = "APPS-SBT-01"
  vnet_name           = "VN-ELX-EUS-Concent-NonProd-Spoke-001"
  resource_group_name = "RG-ELX-EUS-Concent-NonProd-Networking"
}

eventgrid_system_topic_name                   = "eg-s-topic-sales-catalog-ingestion-oneint"
eventgrid_subscription_name                   = "sbsc-sales-catalog-ingestion"
eventgrid_subscription_advanced_filter_values = ["rex-"]
eventgrid_custom_topic_name                   = "eg-c-topic-sales-catalog-ingestion-oneint"
