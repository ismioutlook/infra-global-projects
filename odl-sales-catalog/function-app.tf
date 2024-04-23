resource "azurerm_linux_function_app" "sales-catalog-ingestion-fap" {
  count                       = var.enabled ? 1 : 0
  name                        = var.function_app_name
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  service_plan_id             = var.service_plan_name
  storage_account_name        = var.storage_account_name
  storage_account_access_key  = azurerm_storage_account.sales-catalog-ingestion[count.index].primary_access_key
  zip_deploy_file             = data.archive_file.function.output_path
  functions_extension_version = "~4"
  tags                        = local.tags

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"       = "python"
    "ENABLE_ORYX_BUILD"              = true
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = true
    "AzureWebJobsFeatureFlags"       = "EnableWorkerIndexing"
  }

  depends_on = [data.archive_file.function]

}

resource "azurerm_app_service_virtual_network_swift_connection" "function-app-subnet-map" {
  count          = var.enabled ? 1 : 0
  app_service_id = azurerm_linux_function_app.sales-catalog-ingestion-fap[count.index].id
  subnet_id      = azurerm_subnet.sc-ingestion-sbnt.id
}
