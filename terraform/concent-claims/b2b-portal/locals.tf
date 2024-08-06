locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "b2b-portal"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id
  subscription_id = data.azurerm_subscription.current.subscription_id
}
data "azurerm_subscription" "current" {}
