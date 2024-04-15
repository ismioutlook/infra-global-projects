module "kv" {
  count                      = var.enabled ? 1 : 0
  source                     = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-keyvault//module?ref=feature/tpa-Claims"
  tenant_id                  = local.tenant_id
  resource_group_name        = azurerm_resource_group.rg[0].name
  resource_group_location    = azurerm_resource_group.rg[0].location
  key_vault_name             = var.key_vault_name
  soft_delete_retention_days = var.soft_delete_retention_days
  kv_sku_name                = var.kv_sku_name
  reader_obj_ids             = var.kv_policy_objects_ids.reader_obj_ids
  admin_obj_ids              = var.kv_policy_objects_ids.admin_obj_ids
}


