module "sa" {
  count                       = var.enabled ? 1 : 0
  source                      = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-sa//module/sa?ref=v0.0.1"
  resource_group_location     = azurerm_resource_group.rg[0].location
  tenant_id                   = local.tenant_id
  subscription_id             = local.subscription_id
  resource_group_name         = azurerm_resource_group.rg[0].name
  storage_account_name        = var.storage_account_name
  storage_account_tier        = var.storage_account_tier
  storage_account_replication = var.storage_account_replication
}

module "sa_ctr" {
  count                         = var.enabled ? 1 : 0
  source                        = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-sa//module/sa_ctr?ref=v0.0.1"
  resource_group_location       = var.resource_group_location
  tenant_id                     = data.azurerm_subscription.current.tenant_id
  subscription_id               = data.azurerm_subscription.current.subscription_id
  resource_group_name           = var.resource_group_name
  storage_account_name          = var.storage_account_name
  storage_container_name        = var.storage_container_name
  storage_container_access_type = var.storage_container_access_type
  depends_on                    = [module.sa]
}