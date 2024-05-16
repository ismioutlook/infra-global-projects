# resource "azurerm_key_vault_access_policy" "kv_admin_access_policy" {
#   for_each = toset(local.kv_admin_object_ids)

#   object_id    = each.value
#   tenant_id    = local.tenant_id
#   key_vault_id = module.kv[0].key_vault_id

#   key_permissions = [
#     "Backup",
#     "Create",
#     "Decrypt",
#     "Delete",
#     "Encrypt",
#     "Get",
#     "Import",
#     "List",
#     "Purge",
#     "Recover",
#     "Restore",
#     "Sign",
#     "UnwrapKey",
#     "Update",
#     "Verify",
#     "WrapKey",
#     "GetRotationPolicy",
#     "SetRotationPolicy"
#   ]

#   secret_permissions = [
#     "Backup",
#     "Delete",
#     "Get",
#     "List",
#     "Purge",
#     "Recover",
#     "Restore",
#     "Set",
#   ]

#   #   certificate_permissions = [
#   #     "Backup",
#   #     "Create",
#   #     "Delete",
#   #     "DeleteIssuers",
#   #     "Get",
#   #     "GetIssuers",
#   #     "Import",
#   #     "List",
#   #     "ListIssuers",
#   #     "ManageContacts",
#   #     "ManageIssuers",
#   #     "Purge",
#   #     "Recover",
#   #     "Restore",
#   #     "SetIssuers",
#   #     "Update",
#   #   ]

#   storage_permissions = [
#     "Get",
#     "Recover",
#     "Update",
#   ]
# }

# # resource "azurerm_key_vault_access_policy" "kv_user_access_tmp" {
# #   key_vault_id = module.kv[0].key_vault_id
# #   tenant_id    = local.tenant_id

# #   # Grant user identity the permission to set secrets
# #   object_id = "212ab792-786b-40d4-9cae-3e21087453f2"

# #   secret_permissions = [
# #     "Set",
# #     "Get",
# #     "List"
# #   ]
# # }

# # Assign a role to the user https://learn.microsoft.com/en-us/azure/key-vault/general/rbac-guide?tabs=azure-cli
# # resource "azurerm_role_assignment" "kv_user_access_assign_tmp" {
# #   scope                = module.kv[0].key_vault_id
# #   role_definition_name = "Key Vault Secrets Officer"
# #   principal_id         = "212ab792-786b-40d4-9cae-3e21087453f2"
# # }