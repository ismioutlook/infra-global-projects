locals {
  principal_group_names = distinct(concat(flatten([
    for user, value in var.aks_builtin_role_assignments : value.principal_group_names
    ]),
    flatten([
      for user, value in var.apim_builtin_role_assignments : value.principal_group_names
    ]),
    flatten([
      for user, value in var.app_insights_builtin_role_assignments : value.principal_group_names
  ])))
  flat_role_assign_map = flatten([
    for k, v in var.aks_builtin_role_assignments : [
      for group in v.principal_group_names : {
        role  = k
        group = group
      }
    ]
  ])
  apim_flat_role_assign_map = flatten([
    for k, v in var.apim_builtin_role_assignments : [
      for group in v.principal_group_names : {
        role  = k
        group = group
      }
    ]
  ])

  app_insights_flat_role_assign_map = flatten([
    for k, v in var.app_insights_builtin_role_assignments : [
      for group in v.principal_group_names : {
        role  = k
        group = group
      }
    ]
  ])

  api_gw_flat_role_assign_map = flatten([
    for k, v in var.api_gw_builtin_role_assignments : [
      for group in v.principal_group_names : {
        role  = k
        group = group
      }
    ]
  ])
}