resource "azurerm_storage_account" "sales-catalog-ingestion" {
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
  storage_account_name  = azurerm_storage_account.sales-catalog-ingestion[count.index].name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_blob" "storage_blob" {
  count                  = var.enabled ? 1 : 0
  name                   = "${filesha256(var.archive_file.output_path)}.zip"
  storage_account_name   = azurerm_storage_account.sales-catalog-ingestion[count.index].name
  storage_container_name = azurerm_storage_container.sales-catalog-ingestion-cont[count.index].name
  type                   = "Block"
  source                 = var.archive_file.output_path
}

data "azurerm_storage_account_blob_container_sas" "storage_account_blob_container_sas" {
  count             = var.enabled ? 1 : 0
  connection_string = azurerm_storage_account.sales-catalog-ingestion[count.index].primary_connection_string
  container_name    = azurerm_storage_container.sales-catalog-ingestion-cont[count.index].name

  start  = "2024-04-25T00:00:00Z"
  expiry = "2025-01-01T00:00:00Z"

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = false
  }
}