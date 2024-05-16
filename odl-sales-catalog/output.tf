# Output the connection string of the storage account
output "storage_account_sc_rex_conn_str" {
  description = "Value of the storage account access connection string"
  value       = azurerm_storage_account.sales-catalog-rex-upload[count.index].primary_connection_string
}