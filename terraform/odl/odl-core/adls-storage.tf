resource "azurerm_storage_account" "sa" {
  count                    = local.enabled_storage_account ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg[0].name
  location                 = azurerm_resource_group.rg[0].location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
  account_kind             = var.account_kind
  is_hns_enabled           = var.is_hns_enabled
}

module "storage_container" {
  count                 = local.enabled_storage_account ? 1 : 0
  source                = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-storage-container//module?ref=dev"
  storage_account_name  = azurerm_storage_account.sa[0].name
  container_name        = var.storage_container_name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_role_assignment" "reader_and_data_access" {
  for_each = local.enabled_storage_account ? toset(var.reader_and_data_access_grantees) : []

  scope                = azurerm_storage_account.sa[0].id
  role_definition_name = "Reader and Data Access"
  principal_id         = data.azuread_group.data_access[each.key].object_id
  principal_type       = "Group"
}