resource "azurerm_resource_group" "rg" {
  count    = var.enabled ? 1 : 0
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = local.tags
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_role_assignment" "rg_reader" {
  for_each = var.enabled ? toset(var.resource_group_readers) : []

  scope                = azurerm_resource_group.rg[0].id
  role_definition_name = "Reader"
  principal_id         = data.azuread_group.rg_reader[each.key].object_id
  principal_type       = "Group"
}