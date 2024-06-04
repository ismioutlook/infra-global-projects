resource "azurerm_role_assignment" "api_gw_rbac" {
  for_each = { for item in local.api_gw_flat_role_assign_map : "${item.role}-${item.group}" => item }

  principal_id         = data.azuread_group.ad_groups[each.value.group].object_id
  scope                = data.azurerm_application_gateway.app_gateway.id
  role_definition_name = each.value.role
  principal_type       = "Group"
}