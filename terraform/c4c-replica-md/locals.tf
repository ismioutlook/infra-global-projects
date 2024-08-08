locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "c4c-replica"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id
  subscription_id = data.azurerm_subscription.current.subscription_id
  tenant_id_map   = { tenant_id = "${local.tenant_id}" }
}
data "azurerm_subscription" "current" {}
