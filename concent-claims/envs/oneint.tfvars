enabled                                   = true
resource_group_name                       = "RG-ELX-TPA-Claim-1int-NA"
resource_group_location                   = "eastus"
key_vault_name                            = "kv-tpa-claims-1int-01"
soft_delete_retention_days                = 90
kv_sku_name                               = "standard"
log_analytics_workspace_name              = "LA-ELX-TPA-Claim-Oneintegration"
log_analytics_workspace_sku               = "PerGB2018"
log_analytics_workspace_retention_in_days = "90"
storage_account_name                      = "satpaclaimsoneint"
storage_container_name                    = "tpaclaim-oneint"
storage_container_access_type             = "private"
storage_account_tier                      = "Standard"
storage_account_replication               = "GRS"
app_insights_name                         = "AI-ELX-TPA-Claim-oneintegration"
app_insights_type                         = "web"
data_factory_name                         = "adf-elx-tpa-claim-oneintegration"
logic_app_name                            = "logicapp-tpa-claim-oneintegration-eastus"
app_service_plan_name                     = "aspws-tpa-claim-oneintegration-eastus001"
enabled_logicapp                          = false

kv_policy_objects_ids = {
  reader_objects_ids = [
    # michal.hornak@electrolux.com
    "ff2822e1-8fd6-440b-871f-63961030ac60",
    # robert.steiner@electrolux.com
    "d5d905fb-f135-4b3b-99ef-cd536b38f834",
    # sandhiya.ub@electrolux.com
    "2f6bed09-77e5-4ca9-a5f8-fe53d3d1a414",
    # victor.zadiran@electrolux.com
    "a4e4df86-36f9-41a2-8fce-c9c09f6fccb2",
    # sp-elx-global-concent-dev
    "88545403-aa0f-4121-8cc4-57d35852144d"
  ]
  admin_objects_ids = []
}