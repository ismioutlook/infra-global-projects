resource_group_name     = "RG-ELX-ODL-Dev-WEU"
resource_group_location = "westeurope"


# ------------------------Keyvault Resource Group Details for EU region------------------------------
kv_resource_group_name     = "RG-ELX-GL-Concent-KeyVaults"
kv_resource_group_location = "West Europe"


#-----------------------------KeyVault----------------------
key_vault_name             = "kv-odl-sops-eu-prod"
soft_delete_retention_days = 90
kv_sku_name                = "standard"

kv_keys = ["odl-sops-prod"]
