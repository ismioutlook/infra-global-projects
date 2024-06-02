resource "azurerm_role_assignment" "apim_rbac" {
  for_each = { for item in local.apim_flat_role_assign_map : "${item.role}-${item.group}" => item }

  principal_id         = data.azuread_group.ad_groups[each.value.group].object_id
  scope                = data.azurerm_api_management.apim_service.id
  role_definition_name = each.value.role
  principal_type       = "Group"
}