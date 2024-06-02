locals {
  principal_group_names = distinct(flatten([
    for user, value in var.aks_builtin_role_assignments : value.principal_group_names
  ]))
  flat_role_assign_map = flatten([
    for k, v in var.aks_builtin_role_assignments : [
      for group in v.principal_group_names : {
        role  = k
        group = group
      }
    ]
  ])
}