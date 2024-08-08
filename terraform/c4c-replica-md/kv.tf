module "kv" {
  count                         = var.enabled ? 1 : 0
  source                        = "Azure/avm-res-keyvault-vault/azurerm"
  version                       = "v0.7.1"
  name                          = var.key_vault_name
  enable_telemetry              = var.enable_telemetry
  location                      = module.rg[0].location
  resource_group_name           = module.rg[0].name
  tenant_id                     = local.tenant_id
  sku_name                      = var.kv_sku_name
  soft_delete_retention_days    = var.soft_delete_retention_days
  public_network_access_enabled = false
  # private_endpoints = {
  #   primary = {
  #     private_dns_zone_resource_ids = [azurerm_private_dns_zone.this.id]
  #     subnet_resource_id            = azurerm_subnet.this.id
  #   }
  # }
  role_assignments = var.kv_role_assignments
}