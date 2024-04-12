resource "azurerm_storage_account" "sales-catalog-ingestion-sa" {
  count                    = var.enabled ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                     = local.tags
}

resource "azurerm_storage_container" "sales-catalog-ingestion-cont" {
  count                 = var.enabled ? 1 : 0
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sales-catalog-ingestion-sa.name
  container_access_type = var.storage_container_access_type
}