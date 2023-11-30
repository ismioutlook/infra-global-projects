module "apim-multi-location" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-apim//module?ref=v0.0.9"
  tenant_id               = var.subscription.nonprod.tenant_id
  subscription_id         = var.subscription.nonprod.subscription_id
  resource_group_name     = var.eu_vars.resource_group.resource_group_name
  resource_group_location = var.eu_vars.resource_group.resource_group_location
  subnet_id1              = var.eu_vars.api_management.apim_subnet_id_eu
  subnet_id2              = var.eu_vars.api_management.apim_subnet_id_us
  additional_locations    = var.eu_vars.api_management.additional_locations #var.us_vars.resource_group.resource_group_location
  apim_name               = var.eu_vars.api_management.apim_name
  apim_publisher_name     = var.eu_vars.api_management.apim_publisher_name
  apim_publisher_email    = var.eu_vars.api_management.apim_publisher_email
  apim_sku_name           = var.eu_vars.api_management.apim_sku_name
  #gateway_hostname          = var.eu_vars.api_management.gateway_hostname
  gateway_hostnames         = var.eu_vars.api_management.gateway_hostnames
  developer_portal_hostname = var.eu_vars.api_management.developer_portal_hostname
  management_hostname       = var.eu_vars.api_management.management_hostname
  scm_hostname              = var.eu_vars.api_management.scm_hostname
  key_vault_secret_id       = var.eu_vars.api_management.key_vault_secret_id
  #Tags    
  env_tag          = var.eu_vars.tags.env_tag
  owner_tag        = var.eu_vars.tags.owner_tag
  account_tag      = var.eu_vars.tags.account_tag
  billingid_tag    = var.eu_vars.tags.billingid_tag
  costcenterit_tag = var.eu_vars.tags.costcenterit_tag
  sector_tag       = var.eu_vars.tags.sector_tag
  created_by_tag   = var.eu_vars.tags.created_by_tag

  depends_on = [module.eu_gl_rg]
}
