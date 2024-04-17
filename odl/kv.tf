module "kv" {
  source                     = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-keyvault//module?ref=v0.0.4"
  tenant_id                  = local.tenant_id
  resource_group_name        = var.kv_resource_group_name
  resource_group_location    = var.kv_resource_group_location
  key_vault_name             = var.key_vault_name
  soft_delete_retention_days = var.soft_delete_retention_days
  kv_sku_name                = var.kv_sku_name

}

resource "azurerm_key_vault_key" "odl-sops-dev" {
  name         = "odl-sops-dev"
  key_vault_id = module.kv.key_vault_id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }

    expire_after         = "P90D"
    notify_before_expiry = "P29D"
  }
}


resource "azurerm_key_vault_key" "odl-sops-oneint" {
  name         = "odl-sops-oneint"
  key_vault_id = module.kv.key_vault_id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }

    expire_after         = "P90D"
    notify_before_expiry = "P29D"
  }
}
