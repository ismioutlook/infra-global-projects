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

# resource "azurerm_api_management_backend" "backend" {
#   for_each            = {
#   topic1 = {
#     eventgrid_custom_topic_name = "eg-topic-odlcore-individualcustomer-entity-dev"
#     apim_named_value_name = "odl-core-customer-eg-topic-key-dev"
#     apim_backend_name = "odl-core-customer-dev-tf"
#     eventgrid_custom_subscriptions = {
#       "subscription1" = {
#         name                              = "c4c-individualcustomer-webhook"
#         endpoint_url                      = "https://westeurope.azure.data.mongodb-api.com/app/odl-core-eu-cdc-fplko/endpoint/cdc/IndividualCustomer"
#         max_events_per_batch              = 10
#         preferred_batch_size_in_kilobytes = 640
#         subject_begins_with               = "IndividualCustomer.Root"
#         subject_ends_with                 = ""
#         case_sensitive                    = false
#       }
#     }
#   }}
#   name                = "odl-core-customer-dev"
#   description = "odl-core-customer-dev"
#   resource_group_name = var.api_management_srv_details.resource_group_name
#   api_management_name = var.api_management_srv_details.name
#   protocol            = "http"
#   url                 = module.eventgrid_topics[each.key].endpoint

#   credentials {
#     header = {
#       "aeg-sas-key"= "{{odl-core-customer-eg-topic-dev}}"
#   }
#   }
#   tls {
#     validate_certificate_chain = true
#     validate_certificate_name = true
#   }
# }


# resource "azurerm_api_management_backend" "backend" {
#   for_each            = {
#   topic2 = {
#     eventgrid_custom_topic_name = "eg-topic-odlcore-registeredproduct-entity-dev"
#     apim_named_value_name = "odl-core-regproduct-eg-topic-key-dev"
#     apim_backend_name = "odl-core-regproduct-dev"
#     eventgrid_custom_subscriptions = {
#       "subscription1" = {
#         name                              = "c4c-registeredproduct-webhook"
#         endpoint_url                      = "https://westeurope.azure.data.mongodb-api.com/app/odl-core-eu-cdc-fplko/endpoint/cdc/RegisteredProduct"
#         max_events_per_batch              = 10
#         preferred_batch_size_in_kilobytes = 640
#         subject_begins_with               = "InstallationPoint/RegisteredProduct.Root"
#         subject_ends_with                 = ""
#         case_sensitive                    = false
#       }
#     }
#   }}
#   name                = "odl-core-registeredproduct-dev"
#   description = "odl-core-registeredproduct-dev"
#   resource_group_name = var.api_management_srv_details.resource_group_name
#   api_management_name = var.api_management_srv_details.name
#   protocol            = "http"
#   url                 = module.eventgrid_topics[each.key].endpoint

#   credentials {
#     header = {
#       "aeg-sas-key"= "{{odl-core-registeredproduct-eg-topic-dev}}"
#   }
#   }
#   tls {
#     validate_certificate_chain = true
#     validate_certificate_name = true
#   }
# }