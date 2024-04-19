resource "azurerm_eventgrid_system_topic" "sales-catalog-ingestion-sytp" {
  name                   = var.eventgrid_system_topic_name
  source_arm_resource_id = azurerm_storage_account.sales-catalog-ingestion.id
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  topic_type             = "Microsoft.Storage.StorageAccounts"
}
