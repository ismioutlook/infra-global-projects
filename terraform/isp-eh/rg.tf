resource "azurerm_resource_group" "rg" {
  count    = var.enabled ? 1 : 0
  name     = var.resource_group_name
  location = var.resource_group_location
}