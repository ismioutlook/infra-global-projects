resource "azurerm_private_endpoint" "mongo_endpoint" {
  for_each            = local.mongo_prv_endpoints
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = each.value.subnet_id

  private_service_connection {
    name                           = each.value.private_service_connection.name
    private_connection_resource_id = each.value.private_service_connection.private_connection_resource_id
    is_manual_connection           = true
    #tf fails if request_message is empty
    #see: https://github.com/hashicorp/terraform-provider-azurerm/issues/23763
    request_message = "dummy"
  }
}