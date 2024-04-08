module "data_factory" {
  count                   = var.enabled ? 1 : 0
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-datafactory//module?ref=v0.0.3"
  resource_group_location = azurerm_resource_group.rg[0].location
  tenant_id               = local.tenant_id
  subscription_id         = local.subscription_id
  resource_group_name     = azurerm_resource_group.rg[0].name
  data_factory_name       = var.data_factory_name
  identity_type           = "SystemAssigned"
  identity_ids            = ["416f67b6-e6cd-4ea8-8b84-e6a9c0d08bc9"]
}