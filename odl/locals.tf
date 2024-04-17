locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "ODL"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id
  subscription_id = data.azurerm_subscription.current.subscription_id
}
