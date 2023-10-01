module "eu_gl_appgw" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.10"
  tenant_id               = var.subscription.nonprod.tenant_id
  subscription_id         = var.subscription.nonprod.subscription_id
  resource_group_name     = var.eu_vars.resource_group.resource_group_name
  resource_group_location = var.eu_vars.resource_group.resource_group_location
  appgw_pip_name          = var.eu_vars.app_gateway.appgw_pip_name
  appgw_pip_allocation    = var.eu_vars.app_gateway.appgw_pip_allocation
  appgw_name              = var.eu_vars.app_gateway.appgw_name
  appgw_sku_name          = var.eu_vars.app_gateway.appgw_sku_name
  appgw_sku_tier          = var.eu_vars.app_gateway.appgw_sku_tier
  appgw_ip_config_name    = var.eu_vars.app_gateway.appgw_ip_config_name
  subnet_frontend_id      = var.eu_vars.app_gateway.subnet_id #module.eu_gl_virtualNetwork.subnet_name[1]
  ssl_certificate_name    = var.eu_vars.app_gateway.ssl_certificate_name
  key_vault_secret_id     = var.eu_vars.app_gateway.key_vault_secret_id
  hostname                = var.eu_vars.app_gateway.hostname
  apim_address_pool       = var.eu_vars.app_gateway.apim_address_pool
  user_managed_identity   = var.eu_vars.app_gateway.user_managed_identity
  #WAF Configurations
  waf_enabled                  = var.waf_enabled
  waf_firewall_mode            = var.waf_firewall_mode
  waf_rule_set_type            = var.waf_rule_set_type
  waf_rule_set_version         = var.waf_rule_set_version
  waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
  waf_request_body_check       = var.waf_request_body_check
  waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
  depends_on                   = [module.eu_gl_rg, module.eu_gl_virtualNetwork]
}


module "us_gl_appgw" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.10"
  tenant_id               = var.subscription.nonprod.tenant_id
  subscription_id         = var.subscription.nonprod.subscription_id
  resource_group_name     = var.us_vars.resource_group.resource_group_name_us
  resource_group_location = var.us_vars.resource_group.resource_group_location_us
  appgw_pip_name          = var.us_vars.app_gateway.appgw_pip_name_us
  appgw_pip_allocation    = var.us_vars.app_gateway.appgw_pip_allocation_us
  appgw_name              = var.us_vars.app_gateway.appgw_name_us
  appgw_sku_name          = var.us_vars.app_gateway.appgw_sku_name_us
  appgw_sku_tier          = var.us_vars.app_gateway.appgw_sku_tier_us
  appgw_ip_config_name    = var.us_vars.app_gateway.appgw_ip_config_name_us
  subnet_frontend_id      = var.us_vars.app_gateway.subnet_id_us #module.eu_gl_virtualNetwork.subnet_name[1]
  ssl_certificate_name    = var.us_vars.app_gateway.ssl_certificate_name
  key_vault_secret_id     = var.us_vars.app_gateway.key_vault_secret_id
  hostname                = var.us_vars.app_gateway.hostname
  apim_address_pool       = var.us_vars.app_gateway.apim_address_pool_us
  user_managed_identity   = var.us_vars.app_gateway.user_managed_identity_us
  #WAF Configurations
  waf_enabled                  = var.waf_enabled
  waf_firewall_mode            = var.waf_firewall_mode
  waf_rule_set_type            = var.waf_rule_set_type
  waf_rule_set_version         = var.waf_rule_set_version
  waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
  waf_request_body_check       = var.waf_request_body_check
  waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
  depends_on                   = [module.us_gl_rg, module.us_gl_virtualNetwork]
}

module "us2_gl_appgw" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.10"
  tenant_id               = var.subscription.nonprod.tenant_id
  subscription_id         = var.subscription.nonprod.subscription_id
  resource_group_name     = var.us2_vars.resource_group.resource_group_name_us2
  resource_group_location = var.us2_vars.resource_group.resource_group_location_us2
  appgw_pip_name          = var.us2_vars.app_gateway.appgw_pip_name_us2
  appgw_pip_allocation    = var.us2_vars.app_gateway.appgw_pip_allocation_us2
  appgw_name              = var.us2_vars.app_gateway.appgw_name_us2
  appgw_sku_name          = var.us2_vars.app_gateway.appgw_sku_name_us2
  appgw_sku_tier          = var.us2_vars.app_gateway.appgw_sku_tier_us2
  appgw_ip_config_name    = var.us2_vars.app_gateway.appgw_ip_config_name_us2
  subnet_frontend_id      = var.us2_vars.app_gateway.subnet_id_us2 #module.eu_gl_virtualNetwork.subnet_name[1]
  ssl_certificate_name    = var.us2_vars.app_gateway.ssl_certificate_name
  key_vault_secret_id     = var.us2_vars.app_gateway.key_vault_secret_id
  hostname                = var.us2_vars.app_gateway.hostname
  apim_address_pool       = var.us2_vars.app_gateway.apim_address_pool_us2
  user_managed_identity   = var.us2_vars.app_gateway.user_managed_identity_us2
  #WAF Configurations
  waf_enabled                  = var.waf_enabled
  waf_firewall_mode            = var.waf_firewall_mode
  waf_rule_set_type            = var.waf_rule_set_type
  waf_rule_set_version         = var.waf_rule_set_version
  waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
  waf_request_body_check       = var.waf_request_body_check
  waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
  depends_on                   = [module.us2_gl_rg, module.us2_gl_virtualNetwork]
}