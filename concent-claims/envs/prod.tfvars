enabled                                   = true
resource_group_name                       = "RG-ELX-TPA-Claim-prod-NA"
resource_group_location                   = "eastus"
key_vault_name                            = "kv-tpa-claims-prod-01"
soft_delete_retention_days                = 90
kv_sku_name                               = "standard"
log_analytics_workspace_name              = "LA-ELX-TPA-Claim-Prod"
log_analytics_workspace_sku               = "PerGB2018"
log_analytics_workspace_retention_in_days = "90"
storage_account_name                      = "satpaclaimsprod"
storage_container_name                    = "tpaclaim-prod"
storage_container_access_type             = "private"
storage_account_tier                      = "Standard"
storage_account_replication               = "GRS"
app_insights_name                         = "AI-ELX-TPA-Claim-prod"
app_insights_type                         = "web"
data_factory_name                         = "adf-elx-tpa-claim-prod"
logic_app_name                            = "RG-Elux-TPA-Claim-ConsumptionPlan-LA-prod"
logic_app_type                            = "Microsoft.Logic/workflows"