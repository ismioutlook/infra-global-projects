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
access_policies = [
  {
    application_id          = ""
    certificate_permissions = []
    key_permissions = [
      "Get",
      "Create",
      "Import",
    ]
    object_id = "88545403-aa0f-4121-8cc4-57d35852144d"
    secret_permissions = [
      "Get",
      "Set",
    ]
    storage_permissions = [
      "Get",
      "Recover",
      "Update",
    ]
  },
  {
    application_id          = ""
    certificate_permissions = []
    key_permissions = [
      "Get",
      "List",
    ]
    object_id = "d5d905fb-f135-4b3b-99ef-cd536b38f834"
    secret_permissions = [
      "Get",
      "List",
    ]
    storage_permissions = []
  },
  {
    application_id          = ""
    certificate_permissions = []
    key_permissions = [
      "Get",
      "List",
    ]
    object_id = "2f6bed09-77e5-4ca9-a5f8-fe53d3d1a414"
    secret_permissions = [
      "Get",
      "List",
    ]
    storage_permissions = []
  },
  {
    application_id          = ""
    certificate_permissions = []
    key_permissions = [
      "Get",
      "List",
    ]
    object_id = "a4e4df86-36f9-41a2-8fce-c9c09f6fccb2"
    secret_permissions = [
      "Get",
      "List",
    ]
    storage_permissions = []
  },
  {
    application_id          = ""
    certificate_permissions = []
    key_permissions = [
      "Get",
      "List",
    ]
    object_id = "ff2822e1-8fd6-440b-871f-63961030ac60"
    secret_permissions = [
      "Get",
      "List",
    ]
    storage_permissions = []
  },
  {
    application_id          = ""
    certificate_permissions = []
    key_permissions = [
      "Get",
      "List",
    ]
    object_id = "416f67b6-e6cd-4ea8-8b84-e6a9c0d08bc9"
    secret_permissions = [
      "Get",
      "List",
    ]
    storage_permissions = []
  },
]
