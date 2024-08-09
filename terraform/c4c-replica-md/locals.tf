locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "c4c-replica"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id
  subscription_id = data.azurerm_subscription.current.subscription_id
  tenant_id_map   = { tenant_id = "${local.tenant_id}" }
  kv_adf_roleassignment = {
    secrets_officer = {
      role_definition_id_or_name = "Key Vault Secrets Officer"
      principal_id               = "${module.adf[0].data_factory_managed_identity}"
      principal_type             = "ServicePrincipal"

    }
  }


}
data "azurerm_subscription" "current" {}
