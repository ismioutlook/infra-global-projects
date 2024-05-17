resource "azurerm_storage_account" "sales-catalog-ingestion" {
  count                    = var.enabled ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                     = local.tags
}

resource "azurerm_storage_account" "sales-catalog-rex-upload" {
  count                    = var.enabled ? 1 : 0
  name                     = var.storage_account_name_rex
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                     = local.tags
}

resource "azurerm_storage_container" "sales-catalog-ingestion-cont" {
  count                 = var.enabled ? 1 : 0
  name                  = var.storage_container_name_rex
  storage_account_name  = azurerm_storage_account.sales-catalog-rex-upload[count.index].name
  container_access_type = var.storage_container_access_type
}

# resource "azurerm_storage_blob" "storage_blob" {
#   count                  = var.enabled ? 1 : 0
#   name                   = "${filesha256(data.archive_file.function.output_path)}.zip"
#   storage_account_name   = azurerm_storage_account.sales-catalog-ingestion[count.index].name
#   storage_container_name = azurerm_storage_container.sales-catalog-ingestion-cont[count.index].name
#   type                   = "Block"
#   source                 = data.archive_file.function.output_path
# }