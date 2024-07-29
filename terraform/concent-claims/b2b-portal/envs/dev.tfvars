enabled                                   = true
resource_group_name                       = "RG-ELX-B2b-Portal-Dev-NA"
resource_group_location                   = "eastus"
key_vault_name                            = "elxkv-b2b-portal-dev-01"
soft_delete_retention_days                = 90
kv_sku_name                               = "standard"
log_analytics_workspace_name              = "LA-ELX-b2b-portal-Dev"
log_analytics_workspace_sku               = "PerGB2018"
log_analytics_workspace_retention_in_days = "90"
storage_account_name                      = "sab2bportaldev"
storage_container_name                    = "b2bportal-dev"
storage_container_access_type             = "private"
storage_account_tier                      = "Standard"
storage_account_replication               = "GRS"
app_insights_name                         = "ai-elx-b2b-portal-Dev"
app_insights_type                         = "web"
logic_app_name                            = "logicapp-b2b-portal-dev-eastus"
app_service_plan_name                     = "aspws-b2b-portal-dev-eastus001"

kv_role_assignments = {
  cert_officer1 = {
    role_definition_id_or_name = "Key Vault Certificates Officer"
    principal_id               = "ff2822e1-8fd6-440b-871f-63961030ac60" # michal.hornak@electrolux.com
    principal_type             = "User"

  },
  cert_officer2 = {
    role_definition_id_or_name = "Key Vault Certificates Officer"
    principal_id               = "a4e4df86-36f9-41a2-8fce-c9c09f6fccb2" #  victor.zadiran@electrolux.com
    principal_type             = "User"

  },
  cert_officer3 = {
    role_definition_id_or_name = "Key Vault Certificates Officer"
    principal_id               = "3c05f45b-9541-4624-8201-d98d4da33f3e" #  anindya.chakraborty@electrolux.com
    principal_type             = "User"

  },
  crypto_officer1 = {
    role_definition_id_or_name = "Key Vault Crypto Officer"
    principal_id               = "ff2822e1-8fd6-440b-871f-63961030ac60" # michal.hornak@electrolux.com
    principal_type             = "User"

  },
  crypto_officer2 = {
    role_definition_id_or_name = "Key Vault Crypto Officer"
    principal_id               = "a4e4df86-36f9-41a2-8fce-c9c09f6fccb2" #  victor.zadiran@electrolux.com
    principal_type             = "User"

  },
  crypto_officer3 = {
    role_definition_id_or_name = "Key Vault Crypto Officer"
    principal_id               = "3c05f45b-9541-4624-8201-d98d4da33f3e" #  anindya.chakraborty@electrolux.com
    principal_type             = "User"

  },
  secrets_officer1 = {
    role_definition_id_or_name = "Key Vault Secrets Officer"
    principal_id               = "ff2822e1-8fd6-440b-871f-63961030ac60" # michal.hornak@electrolux.com
    principal_type             = "User"

  },
  secrets_officer2 = {
    role_definition_id_or_name = "Key Vault Secrets Officer"
    principal_id               = "a4e4df86-36f9-41a2-8fce-c9c09f6fccb2" #  victor.zadiran@electrolux.com
    principal_type             = "User"

  },
  secrets_officer3 = {
    role_definition_id_or_name = "Key Vault Secrets Officer"
    principal_id               = "3c05f45b-9541-4624-8201-d98d4da33f3e" #  anindya.chakraborty@electrolux.com
    principal_type             = "User"

  }

}
