enabled                  = true
enabled_keyvault         = false
enabled_storaged_account = false
# ------------------------Keyvault Resource Group Details for EU region------------------------------
kv_resource_group_name     = "RG-ELX-GL-Concent-KeyVaults"
kv_resource_group_location = "West Europe"

#-----------------------------KeyVault----------------------
key_vault_name = "elxkv-odl-sops-eu-prod"

# ------------------------Storage account details for EU region------------------------------
resource_group_name     = "RG-GL-ODL-CORE-1INT-EU"
resource_group_location = "West Europe"
resource_group_readers  = []
mongo_prv_endpoints = {
  mongo-cdi-prod-aks-us-001 = {
    location            = "eastus"
    resource_group_name = "RG-ELX-EUS-Concent-Prod-Networking"
    subnet_id           = "/subscriptions/9a44d85a-3cf1-4938-9509-c8f94b1aee10/resourceGroups/RG-ELX-EUS-Concent-Prod-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-Prod-Spoke-001/subnets/PV-ENDPOINTS-SBT-01"
    private_service_connection = {
      name                           = "pls_66697b0fd69e175b9340f867"
      private_connection_resource_id = "/subscriptions/965414d2-425a-4f59-b691-3a65b282ee5f/resourceGroups/rg_666978003bd93f7004e79ece_xietjuez/providers/Microsoft.Network/privateLinkServices/pls_66697b0fd69e175b9340f867"
    }
  }
}