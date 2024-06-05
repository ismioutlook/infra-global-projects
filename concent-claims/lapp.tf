module "logic_app" {
  count                   = var.enabled ? 1 : 0
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-logicapp//module?ref=v1.3.0"
  resource_group_location = azurerm_resource_group.rg[0].location
  tenant_id               = local.tenant_id
  subscription_id         = local.subscription_id
  resource_group_name     = azurerm_resource_group.rg[0].name //
  logic_app_type          = var.logic_app_type
  logic_app_name          = var.logic_app_name
  workspace_id            = module.law[0].workspace_id
}