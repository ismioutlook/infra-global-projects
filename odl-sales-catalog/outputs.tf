output "storage_account_access_key" {
  value       = azurerm_storage_account.sales-catalog-ingestion[count.index].storage_account_access_key
  description = "Access key for the storage account"
}
