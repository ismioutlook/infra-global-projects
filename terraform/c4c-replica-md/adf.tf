module "adf" {
  count                           = var.enabled ? 1 : 0
  source                          = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-ADF?ref=5483614a28f5f90e1c6b28b54f2b7218a333c184"
  name                            = var.adf_name
  location                        = module.rg[0].location
  resource_group_name             = module.rg[0].name
  integration_runtime_type        = "SelfHosted"
  integration_runtime_custom_name = "c4creplica-IR"
  azure_devops_configuration      = var.azure_devops_configuration != {} ? merge(var.azure_devops_configuration, local.tenant_id_map) : {}
}