resource "azurerm_key_vault_access_policy" "kv_user_access_tmp" {
  key_vault_id = module.kv[0].key_vault_id
  tenant_id    = local.tenant_id

  # Grant user identity the permission to set secrets
  object_id = "212ab792-786b-40d4-9cae-3e21087453f2"

  secret_permissions = [
    "Set",
    "Get",
    "List"
  ]
}

# Assign a role to the user https://learn.microsoft.com/en-us/azure/key-vault/general/rbac-guide?tabs=azure-cli
resource "azurerm_role_assignment" "kv_user_access_assign_tmp" {
  scope                = module.kv[0].key_vault_id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = "212ab792-786b-40d4-9cae-3e21087453f2"
}