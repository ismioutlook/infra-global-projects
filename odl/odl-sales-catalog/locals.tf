locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "ODL"
    product     = "sales catalog"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id
  subscription_id = data.azurerm_subscription.current.subscription_id
  current_user_id = data.azurerm_client_config.current.object_id
  # 75f9a0c1-6e61-4cbe-beba-9ab39034b9a0 ---> CSA-AAD-PRJ-Concent-PE-Admin
  kv_admin_object_ids = ["75f9a0c1-6e61-4cbe-beba-9ab39034b9a0", local.current_user_id, "212ab792-786b-40d4-9cae-3e21087453f2", "a2a6e491-a1ec-4599-aa4e-2c92a946bbf1"]
  enabled_keyvault    = var.enabled && var.enabled_keyvault ? true : false
  principal_group_names = distinct(concat(flatten([
    for user, value in var.storage_account_builtin_role_assignments : value.principal_group_names
    ]),
    flatten([
      for user, value in var.resource_group_builtin_role_assignments : value.principal_group_names
    ]),
    flatten([
      for user, value in var.app_insights_builtin_role_assignments : value.principal_group_names
  ])))
  rg_flat_role_assign_map = flatten([
    for k, v in var.resource_group_builtin_role_assignments : [
      for group in v.principal_group_names : {
        role  = k
        group = group
      }
    ]
  ])
  sa_flat_role_assign_map = flatten([
    for k, v in var.storage_account_builtin_role_assignments : [
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
  storage_account_name      = var.storage_account_name != null ? var.storage_account_name : format("elxnssalescatalog%s001", terraform.workspace)
  virtual_network_subnet_id = coalesce(one(data.azurerm_subnet.subnet[*].id), one(azurerm_subnet.apps-sbnt[*].id))
}
