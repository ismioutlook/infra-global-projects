resource "azurerm_eventgrid_system_topic" "sales-catalog-ingestion-sytp" {
  count                  = var.enabled ? 1 : 0
  name                   = var.eventgrid_system_topic_name
  source_arm_resource_id = azurerm_storage_account.sales-catalog-rex-upload[count.index].id
  resource_group_name    = azurerm_resource_group.rg[0].name
  location               = azurerm_resource_group.rg[0].location
  topic_type             = var.eg_topic_type
}

resource "azurerm_eventgrid_event_subscription" "sales-catalog-ingestion-sbsc" {
  count                 = var.enabled && var.enabled_eventgrid_event_subscription_storageaccount ? 1 : 0
  name                  = var.eventgrid_subscription_name
  scope                 = azurerm_storage_account.sales-catalog-rex-upload[count.index].id
  event_delivery_schema = var.eventgrid_subscription_event_delivery_schema

  azure_function_endpoint {
    function_id                       = "${azurerm_linux_function_app.sales-catalog-ingestion-fap[count.index].id}/functions/SC_REX_EGT"
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
  }

  subject_filter {
    subject_begins_with = "/blobServices/default/containers/${var.storage_container_name_rex}/blobs/${var.storage_container_rex_upload_folder}"
    subject_ends_with   = var.eventgrid_subscription_suffix_filter
  }

  advanced_filter {
    string_contains {
      key    = var.eventgrid_subscription_advanced_filter_key
      values = var.eventgrid_subscription_advanced_filter_values
    }
  }

}

resource "azurerm_eventgrid_topic" "sales-catalog-ingestion-csttp" {
  count               = var.enabled ? 1 : 0
  name                = var.eventgrid_custom_topic_name
  resource_group_name = azurerm_resource_group.rg[0].name
  location            = azurerm_resource_group.rg[0].location
}
