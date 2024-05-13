data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

output "id" {
  value = data.azurerm_resource_group.rg.id
}
