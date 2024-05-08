locals {
  tags = {
    environment = "${terraform.workspace}"
    domain      = "ODL"
    product     = "sales catalog"
  }
  tenant_id       = data.azurerm_subscription.current.tenant_id       #"d2007bef-127d-4591-97ac-10d72fe28031" 
  subscription_id = data.azurerm_subscription.current.subscription_id #"f28071b5-e402-4c1a-83cc-ed0744ce8e0a" #
}