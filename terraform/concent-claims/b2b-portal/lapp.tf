data "azurerm_storage_account" "sa" {
  name                = module.sa[0].name
  resource_group_name = module.rg[0].name
  depends_on          = [module.sa]
}
module "logic_apps" {
  count    = var.enabled ? 1 : 0
  source   = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-logicapp?ref=d1a305d4692fe77d32e6c1d3d7a998109af3fd42"
  rg_name  = module.rg[0].name
  location = module.rg[0].location
  tags     = {}

  logic_apps = [
    {
      id                         = "app1"
      name                       = var.logic_app_name
      app_service_plan_name      = var.app_service_plan_name
      os_type                    = var.app_service_plan_name_os_type
      sku_name                   = var.app_service_plan_name_sku_name
      storage_account_name       = module.sa[0].name
      storage_account_access_key = data.azurerm_storage_account.sa.primary_access_key
      version                    = var.logic_app_version
      enabled                    = true
      app_settings = {
        "FUNCTIONS_WORKER_RUNTIME"     = "node"
        "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
      }
    },
  ]
}