module "storage_account" {
  source                        = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-sa//iasc?ref=v0.0.4"
  tenant_id                     = local.tenant_id
  subscription_id               = local.subscription_id
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  storage_account_name          = var.storage_account_name
  storage_account_tier          = var.storage_account_tier
  storage_account_replication   = var.storage_account_replication
  storage_container_name        = var.storage_container_name
  storage_container_access_type = var.storage_container_access_type
  account_kind                  = var.account_kind
  is_hns_enabled                = var.is_hns_enabled
}
