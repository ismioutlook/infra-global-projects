# module "kv" {
#   count                      = local.enabled_keyvault ? 1 : 0
#   source                     = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-keyvault//module?ref=featue/rotationpolicy-addon"
#   tenant_id                  = local.tenant_id
#   resource_group_name        = var.resource_group_name
#   resource_group_location    = var.resource_group_location
#   key_vault_name             = var.key_vault_name
#   soft_delete_retention_days = var.soft_delete_retention_days
#   kv_sku_name                = var.kv_sku_name
#   admin_objects_ids          = local.kv_admin_object_ids
# }

# resource "azurerm_key_vault_key" "keys" {
#   count        = local.enabled_keyvault ? 1 : 0
#   name         = local.sops_key_name
#   key_vault_id = module.kv[0].key_vault_id
#   key_type     = "RSA"
#   key_size     = 2048

#   key_opts = [
#     "decrypt",
#     "encrypt",
#     "sign",
#     "unwrapKey",
#     "verify",
#     "wrapKey",
#   ]

# }

