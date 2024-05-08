module "rg" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.6"
  resource_group_name     = var.resource_group_name
}

resource "azurerm_role_assignment" "roleassignment" {
  scope                = module.rg.resource_group_id
  role_definition_name = "Contributor"  # This grants read and write access
  principal_id         = "d79194c9-4c6d-4c8c-aa12-9b17bacddc34"  # CSA-AAD-PRJ-Concent-ODL-Developer group
}

module "storage_account" {
  source                        = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-sa//iasc?ref=v0.0.4"
  tenant_id                     = var.tenant_id
  subscription_id               = var.subscription_id
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  storage_account_name          = var.storage_account_name
  storage_account_tier          = var.storage_account_tier
  storage_account_replication   = var.storage_account_replication
  storage_container_name        = var.storage_container_name
  storage_container_access_type = var.storage_container_access_type
  account_kind                  = var.account_kind
  is_hns_enabled                = var.is_hns_enabled
  depends_on = [
    module.rg
  ]
}
