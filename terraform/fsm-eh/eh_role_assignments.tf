resource "azurerm_role_assignment" "app_insights_rbac" {
  for_each = { for item in local.app_insights_flat_role_assign_map : "${item.role}-${item.group}" => item }

  principal_id         = data.azuread_group.ad_groups[each.value.group].object_id
  scope                = data.azurerm_application_insights.app_insights[0].id
  role_definition_name = each.value.role
  principal_type       = "Group"
}