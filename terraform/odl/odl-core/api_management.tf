resource "azurerm_api_management_named_value" "named_value" {
  for_each            = local.eventgrid_topics
  name                = each.value.apim_named_value_name
  resource_group_name = var.api_management_srv_details.resource_group_name
  api_management_name = var.api_management_srv_details.name
  display_name        = each.value.apim_named_value_name
  secret              = true
  value_from_key_vault {
    secret_id = azurerm_key_vault_secret.eventgrid_topic_key[each.key].id
  }
}

resource "azurerm_api_management_backend" "backend" {
  for_each            = local.eventgrid_topics
  name                = each.value.apim_backend_name
  description         = format("Backend configured for event grid topic %s", each.value.eventgrid_custom_topic_name)
  resource_group_name = var.api_management_srv_details.resource_group_name
  api_management_name = var.api_management_srv_details.name
  protocol            = "http"
  url                 = trimsuffix(module.eventgrid_topics[each.key].endpoint, "/events")

  credentials {
    header = {
      "aeg-sas-key" = "{{${azurerm_api_management_named_value.named_value[each.key].name}}}"
    }
  }
  tls {
    validate_certificate_chain = true
    validate_certificate_name  = true
  }
}
