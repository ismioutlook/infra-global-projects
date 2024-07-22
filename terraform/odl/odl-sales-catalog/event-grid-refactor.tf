
resource "azurerm_eventgrid_topic" "eventgrid_topic" {
  for_each            = local.eventgrid_topics
  resource_group_name = azurerm_resource_group.rg[0].name
  location            = azurerm_resource_group.rg[0].location
  name                = each.value.eventgrid_custom_topic_name
}

resource "azurerm_eventgrid_event_subscription" "eventgrid_topic_subscription" {
  for_each = local.eventgrid_event_subscriptions

  name  = each.value.name
  scope = azurerm_eventgrid_topic.eventgrid_topic[trimsuffix(each.key, "-${each.value.name}")].id

  webhook_endpoint {
    url                               = each.value.endpoint_url
    max_events_per_batch              = each.value.max_events_per_batch
    preferred_batch_size_in_kilobytes = each.value.preferred_batch_size_in_kilobytes
  }

  delivery_property {
    header_name = local.header_name
    type        = local.header_type
    value       = local.header_value
    secret      = true
  }

  subject_filter {
    subject_begins_with = each.value.subject_begins_with
    subject_ends_with   = each.value.subject_ends_with
    case_sensitive      = each.value.case_sensitive
  }
}

