resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = module.kv[0].key_vault_id
  tenant_id    = local.tenant_id

  # Grant user identity the permission to set secrets
  object_id = "212ab792-786b-40d4-9cae-3e21087453f2"

  secret_permissions = [
    "set",
  ]
}