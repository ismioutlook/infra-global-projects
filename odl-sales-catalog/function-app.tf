resource "azurerm_function_app" "sales-catalog-ingestion-fap" {
  count                      = var.enabled ? 1 : 0
  name                       = var.function_app_name
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.service_plan_name
  storage_account_name       = var.storage_account_name
  storage_account_access_key = azurerm_storage_account.sales-catalog-ingestion.primary_access_key
  tags                       = local.tags
}
