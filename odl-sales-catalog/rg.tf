resource "azurerm_resource_group" "rg" {
  count    = var.enabled ? 1 : 0
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = local.tags
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_role_assignment" "rg_role_assign" {
  for_each = { for item in local.rg_flat_role_assign_map : "${item.role}-${item.group}" => item }

  principal_id         = data.azuread_group.ad_groups[each.value.group].object_id
  scope                = azurerm_resource_group.rg[0].id
  role_definition_name = each.value.role
  principal_type       = "Group"
}