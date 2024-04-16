module "kv" {
  source                     = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-keyvault//module?ref=v0.0.1"
  tenant_id                  = var.tenant_id
  resource_group_name        = var.resource_group_name
  resource_group_location    = var.resource_group_location
  key_vault_name             = var.key_vault_name
  soft_delete_retention_days = var.soft_delete_retention_days
  kv_sku_name                = var.kv_sku_name

}