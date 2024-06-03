resource "azurerm_role_assignment" "aks_rbac" {
  for_each = { for item in local.flat_role_assign_map : "${item.role}-${item.group}" => item }

  principal_id         = data.azuread_group.ad_groups[each.value.group].object_id
  scope                = data.azurerm_kubernetes_cluster.aks_cluster.id
  role_definition_name = each.value.role
  principal_type       = "Group"
}