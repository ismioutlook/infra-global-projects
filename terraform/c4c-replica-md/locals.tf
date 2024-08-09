locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "c4c-replica"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id
  subscription_id = data.azurerm_subscription.current.subscription_id
  tenant_id_map   = { tenant_id = "${local.tenant_id}" }
  kv_roleassignment = {
    secrets_officer = {
      role_definition_id_or_name = "Key Vault Secrets Officer"
      principal_id               = "${module.adf[0].data_factory_managed_identity[0].identity_ids[0]}"
      principal_type             = "ServicePrincipal"

    },
    secrets_officer1 = {
      role_definition_id_or_name = "Key Vault Secrets Officer"
      principal_id               = "7b48eb24-45d4-4047-816f-441f08b09744" # CSA-AAD-PRJ-ELX-CDI-MD-Writer
      principal_type             = "Group"

    }
  }


}
data "azurerm_subscription" "current" {}
