module "apim-multi-location" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-apim?ref=v0.0.1"
  tenant_id               = var.tenant_id
  subscription_id         = var.subscription_id
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  vnet1_name              = var.vnet1_name
  vnet1_address_space     = var.vnet1_address_space
  subnet1_name            = var.subnet1_name
  subnet1_address_space   = var.subnet1_address_space
  vnet2_name              = var.vnet2_name
  additional_location     = var.additional_location
  vnet2_address_space     = var.vnet2_address_space
  subnet2_name            = var.subnet2_name
  subnet2_address_space   = var.subnet2_address_space
  apim_name               = var.apim_name
  apim_publisher_name     = var.apim_publisher_name
  apim_publisher_email    = var.apim_publisher_email
  apim_sku_name           = var.apim_sku_name

}
