resource "azurerm_logic_app_workflow" "example" {
  count               = var.enabled ? 1 : 0
  name                = var.logic_app_name
  location            = azurerm_resource_group.rg[0].location
  resource_group_name = azurerm_resource_group.rg[0].name
}