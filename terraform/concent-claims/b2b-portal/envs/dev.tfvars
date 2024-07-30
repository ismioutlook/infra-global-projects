enabled                                   = true
resource_group_name                       = "RG-ELX-B2b-Portal-Dev-NA"
resource_group_location                   = "eastus"
key_vault_name                            = "elxkv-b2b-portal-dev-01"
soft_delete_retention_days                = 90
kv_sku_name                               = "standard"
log_analytics_workspace_name              = "LA-ELX-b2b-portal-Dev"
log_analytics_workspace_sku               = "PerGB2018"
log_analytics_workspace_retention_in_days = "90"
storage_account_name                      = "elxnsb2bportaldev001"
storage_container_name                    = "b2bportal-dev"
storage_container_access_type             = "private"
storage_account_tier                      = "Standard"
storage_account_replication               = "GRS"
app_insights_name                         = "ai-elx-b2b-portal-dev"
app_insights_type                         = "web"
logic_app_name                            = "logicapp-b2b-portal-dev-eastus"
app_service_plan_name                     = "aspws-b2b-portal-dev-eastus001"

kv_role_assignments = {
  cert_officer = {
    role_definition_id_or_name = "Key Vault Certificates Officer"
    principal_id               = "0233c628-fb10-4cdd-8a3a-3f9472253b2d" # CSA-AAD-PRJ-ELX-Concent-Claim-Developer
    principal_type             = "Group"

  },
  crypto_officer = {
    role_definition_id_or_name = "Key Vault Crypto Officer"
    principal_id               = "0233c628-fb10-4cdd-8a3a-3f9472253b2d" # CSA-AAD-PRJ-ELX-Concent-Claim-Developer
    principal_type             = "Group"

  },
  secrets_officer = {
    role_definition_id_or_name = "Key Vault Secrets Officer"
    principal_id               = "0233c628-fb10-4cdd-8a3a-3f9472253b2d" # CSA-AAD-PRJ-ELX-Concent-Claim-Developer
    principal_type             = "Group"

  }

}
