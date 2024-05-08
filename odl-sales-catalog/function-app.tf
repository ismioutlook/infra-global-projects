resource "azurerm_linux_function_app" "sales-catalog-ingestion-fap" {
  count                      = var.enabled ? 1 : 0
  name                       = var.function_app_name
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.service_plan_name
  storage_account_name       = var.storage_account_name
  storage_account_access_key = azurerm_storage_account.sales-catalog-ingestion[count.index].primary_access_key
  # zip_deploy_file            = data.archive_file.function.output_path
  virtual_network_subnet_id = azurerm_subnet.sc-ingestion-sbnt.id
  tags                      = local.tags

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "python",
    # "ENABLE_ORYX_BUILD"                        = true,
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = true,
    "FUNCTIONS_EXTENSION_VERSION"    = "~4",
    # "WEBSITE_CONTENTAZUREFILECONNECTIONSTRING" = "DefaultEndpointsProtocol=https;AccountName=${azurerm_storage_account.sales-catalog-ingestion[count.index].name};AccountKey=${azurerm_storage_account.sales-catalog-ingestion[count.index].primary_access_key};EndpointSuffix=core.windows.net",
    # "WEBSITE_CONTENTSHARE"                     = "salescatalogupload"
    # "WEBSITE_RUN_FROM_PACKAGE"                 = "https://${azurerm_storage_account.sales-catalog-ingestion[count.index].name}.blob.core.windows.net/${azurerm_storage_container.sales-catalog-ingestion-cont[count.index].name}/${azurerm_storage_blob.storage_blob[count.index].name}${data.azurerm_storage_account_blob_container_sas.storage_account_blob_container_sas[count.index].sas}",
    # "AzureWebJobsDisableHomepage" = true
  }

  depends_on = [data.archive_file.function]

  provisioner "local-exec" {
    command = <<EOT
       az functionapp deployment source config-zip
       -g ${var.resource_group_name} 
       -n ${var.function_app_name}
       --build-remote true
       --src ${data.archive_file.function.output_path}
  EOT
  }
}