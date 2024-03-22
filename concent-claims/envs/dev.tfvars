enabled                                   = true
resource_group_name                       = "RG-ELX-TPA-Claim-Dev-NA"
resource_group_location                   = "eastus"
key_vault_name                            = "elxkv-tpa-claims-dev-01"
soft_delete_retention_days                = 90
kv_sku_name                               = "standard"
log_analytics_workspace_name              = "LA-ELX-TPA-Claim-Dev"
log_analytics_workspace_sku               = "PerGB2018"
log_analytics_workspace_retention_in_days = "90"
storage_account_name                      = "satpaclaimsdev"
storage_container_name                    = "tpaclaim-dev"
storage_container_access_type             = "private"
storage_account_tier                      = "Standard"
storage_account_replication               = "GRS"
app_insights_name                         = "AI-ELX-TPA-Claim-Dev"
app_insights_type                         = "web"
data_factory_name                         = "adf-elx-tpa-claim-dev"