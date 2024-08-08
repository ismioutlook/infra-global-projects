resource "azurerm_storage_account" "sales-catalog-ingestion" {
  count                    = var.enabled ? 1 : 0
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.rg[0].name
  location                 = azurerm_resource_group.rg[0].location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                     = local.tags
}

resource "azurerm_storage_account" "sales-catalog-rex-upload" {
  count                    = var.enabled ? 1 : 0
  name                     = var.storage_account_name_rex
  resource_group_name      = azurerm_resource_group.rg[0].name
  location                 = azurerm_resource_group.rg[0].location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                     = local.tags
}

resource "azurerm_storage_container" "sales-catalog-ingestion-cont" {
  count                 = var.enabled ? 1 : 0
  name                  = var.storage_container_name_rex
  storage_account_name  = azurerm_storage_account.sales-catalog-rex-upload[count.index].name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_role_assignment" "sa_role_assign" {
  for_each = { for item in local.sa_flat_role_assign_map : "${item.role}-${item.group}" => item }

  principal_id         = data.azuread_group.ad_groups[each.value.group].object_id
  scope                = azurerm_storage_account.sales-catalog-rex-upload[0].id
  role_definition_name = each.value.role
  principal_type       = "Group"
}

resource "azurerm_storage_blob" "rex_landing_folder" {
  count                  = var.enabled ? 1 : 0
  name                   = "${var.storage_container_rex_upload_folder}/.keep"
  storage_account_name   = azurerm_storage_account.sales-catalog-rex-upload[count.index].name
  storage_container_name = azurerm_storage_container.sales-catalog-ingestion-cont[count.index].name
  type                   = "Block"
  source_content         = ""
}
