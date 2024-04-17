resource "azurerm_linux_function_app" "sales-catalog-ingestion-fap" {
  count                      = var.enabled ? 1 : 0
  name                       = var.function_app_name
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.service_plan_name
  storage_account_name       = var.storage_account_name
  storage_account_access_key = azurerm_storage_account.sales-catalog-ingestion[count.index].primary_access_key
  tags                       = local.tags

  site_config {
    linux_fx_version = "PYTHON|3.11"
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "PYTHON_VERSION"           = "3.11"
    "WEBSITE_RUN_FROM_PACKAGE" = "./src/"
  }

}
