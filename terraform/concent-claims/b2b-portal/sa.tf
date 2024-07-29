module "sa" {
  count   = var.enabled ? 1 : 0
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "v0.2.1"

  account_replication_type      = var.storage_account_replication
  account_tier                  = var.storage_account_tier
  account_kind                  = "StorageV2"
  location                      = module.rg[0].location
  name                          = var.storage_account_name
  resource_group_name           = module.rg[0].name
  min_tls_version               = "TLS1_2"
  shared_access_key_enabled     = true
  public_network_access_enabled = true
  enable_telemetry              = false
  network_rules                 = null

}