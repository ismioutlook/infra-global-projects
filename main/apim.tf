module "apim-multi-location" {
  source                    = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-apim//module?ref=v0.0.2"
  tenant_id                 = var.tenant_id
  subscription_id           = var.subscription_id
  resource_group_name       = var.resource_group_name_eu
  resource_group_location   = var.resource_group_location_eu
  subnet_id1                = var.apim_subnet_id_eu
  subnet_id2                = var.apim_subnet_id_us
  subnet_id3                = var.apim_subnet_id_us2
  additional_location1      = var.resource_group_location_us
  additional_location2      = var.resource_group_location_us2
  apim_name                 = var.apim_name
  apim_publisher_name       = var.apim_publisher_name
  apim_publisher_email      = var.apim_publisher_email
  apim_sku_name             = var.apim_sku_name
  # gateway_hostname          = var.gateway_hostname
  # developer_portal_hostname = var.developer_portal_hostname
  # management_hostname       = var.management_hostname
  # scm_hostname              = var.scm_hostname
  # key_vault_secret_id       = var.key_vault_secret_id
  #Tags    
  env_tag          = var.env_tag
  owner_tag        = var.owner_tag
  account_tag      = var.account_tag
  billingid_tag    = var.billingid_tag
  costcenterit_tag = var.costcenterit_tag
  sector_tag       = var.sector_tag
  created_by_tag   = var.created_by_tag

  depends_on = [module.eu_gl_rg, module.eu_gl_virtualNetwork, module.us_gl_virtualNetwork, module.us2_gl_virtualNetwork]
}
