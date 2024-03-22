module "data_factory" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-datafactory//module?ref=v0.0.1"
  resource_group_location = var.resource_group_location
  tenant_id               = var.tenant_id
  subscription_id         = var.subscription_id
  resource_group_name     = var.resource_group_name
  data_factory_name       = var.data_factory_name
}