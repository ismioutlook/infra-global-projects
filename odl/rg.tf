resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = local.tags
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_role_assignment" "rg_reader" {
  for_each = toset(var.resource_group_readers)

  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = data.azuread_group.rg_reader[each.key].object_id
  principal_type       = "Group"
}