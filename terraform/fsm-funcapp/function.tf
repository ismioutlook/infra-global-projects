module "funapp" {
  source                      = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-funcapp//module?ref=v0.0.10"
  resource_group_name         = var.resource_group_name
  resource_group_location     = var.resource_group_location
  storage_account_name        = var.storage_account_name
  storage_account_tier        = var.storage_account_tier
  storage_account_replication = var.storage_account_replication
  function_app_plan_name      = var.function_app_plan_name
  function_app_os             = var.function_app_os
  function_app_plan_sku_size  = var.function_app_plan_sku_size
  function_app_name           = var.function_app_name
  function_app_run_time       = var.function_app_run_time

}