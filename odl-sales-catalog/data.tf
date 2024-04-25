data "azurerm_subscription" "current" {
}

data "archive_file" "function" {
  type        = "zip"
  excludes    = split("\n", file("${path.root}/src/.funcignore"))
  source_dir  = "${path.root}/src"
  output_path = "${path.root}/package.zip"
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
