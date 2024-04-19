resource "azurerm_eventgrid_system_topic" "sales-catalog-ingestion-sytp" {
  count                  = var.enabled ? 1 : 0
  name                   = var.eventgrid_system_topic_name
  source_arm_resource_id = azurerm_storage_account.sales-catalog-ingestion[count.index].id
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  topic_type             = var.eg_topic_type
}
