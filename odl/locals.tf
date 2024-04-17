locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "ODL"
  }
  tenant_id        = data.azurerm_subscription.current.tenant_id
  subscription_id  = data.azurerm_subscription.current.subscription_id
  enabled_keyvault = var.enabled && var.enabled_keyvault ? true : false
  sops_key_name    = format("odl-sopskey-%s", "${terraform.workspace}")
}
