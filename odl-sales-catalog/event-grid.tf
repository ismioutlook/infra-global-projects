resource "azurerm_eventgrid_system_topic" "sales-catalog-ingestion-sytp" {
  count                  = var.enabled ? 1 : 0
  name                   = var.eventgrid_system_topic_name
  source_arm_resource_id = azurerm_storage_account.sales-catalog-ingestion[count.index].id
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  topic_type             = var.eg_topic_type
}

resource "azurerm_eventgrid_event_subscription" "sales-catalog-ingestion-sbsc" {
  count                 = var.enabled ? 1 : 0
  name                  = var.eventgrid_subscription_name
  scope                 = azurerm_eventgrid_system_topic.sales-catalog-ingestion-sytp[count.index].id
  event_delivery_schema = var.eventgrid_subscription_event_delivery_schema

  azure_function_endpoint {
    function_id = "/subscriptions/f28071b5-e402-4c1a-83cc-ed0744ce8e0a/resourceGroups/${var.resource_group_name}/providers/Microsoft.Web/sites/odl-sales-catalog-events-vnet/functions/SCEventGridTrigger"
  }

  subject_filter {
    subject_begins_with = "/blobServices/default/containers/${var.storage_container_name}/blobs/${var.storage_container_rex_upload_folder}"
    subject_ends_with   = var.eventgrid_subscription_suffix_filter
  }

  advanced_filter {
    string_contains {
      key    = var.eventgrid_subscription_advanced_filter_key
      values = var.eventgrid_subscription_advanced_filter_values
    }
  }

}