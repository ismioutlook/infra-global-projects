module "eu_gl_appgw" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.3"
  tenant_id               = var.tenant_id
  subscription_id         = var.subscription_id
  resource_group_name     = var.resource_group_name_eu
  resource_group_location = var.resource_group_location_eu
  appgw_pip_name          = var.appgw_pip_name_eu
  appgw_pip_allocation    = var.appgw_pip_allocation_eu
  appgw_name              = var.appgw_name_eu
  appgw_sku_name          = var.appgw_sku_name_eu
  appgw_sku_tier          = var.appgw_sku_tier_eu
  appgw_sku_capacity      = var.appgw_sku_capacity_eu
  appgw_ip_config_name    = var.appgw_ip_config_name_eu
  subnet_id               = var.subnet_id_eu #module.eu_gl_virtualNetwork.subnet_name[1]
  #WAF Configurations
  waf_enabled                  = var.waf_enabled
  waf_firewall_mode            = var.waf_firewall_mode
  waf_rule_set_type            = var.waf_rule_set_type
  waf_rule_set_version         = var.waf_rule_set_version
  waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
  waf_request_body_check       = var.waf_request_body_check
  waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
  depends_on = [ module.eu_gl_rg, module.eu_gl_virtualNetwork ]
}


module "us_gl_appgw" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.3"
  tenant_id               = var.tenant_id
  subscription_id         = var.subscription_id
  resource_group_name     = var.resource_group_name_us
  resource_group_location = var.resource_group_location_us
  appgw_pip_name          = var.appgw_pip_name_us
  appgw_pip_allocation    = var.appgw_pip_allocation_us
  appgw_name              = var.appgw_name_us
  appgw_sku_name          = var.appgw_sku_name_us
  appgw_sku_tier          = var.appgw_sku_tier_us
  appgw_sku_capacity      = var.appgw_sku_capacity_us
  appgw_ip_config_name    = var.appgw_ip_config_name_us
  subnet_id               = var.subnet_id_us #module.eu_gl_virtualNetwork.subnet_name[1]
  #WAF Configurations
  waf_enabled                  = var.waf_enabled
  waf_firewall_mode            = var.waf_firewall_mode
  waf_rule_set_type            = var.waf_rule_set_type
  waf_rule_set_version         = var.waf_rule_set_version
  waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
  waf_request_body_check       = var.waf_request_body_check
  waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
    depends_on = [ module.us_gl_rg, module.us_gl_virtualNetwork ]
}

module "us2_gl_appgw" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.3"
  tenant_id               = var.tenant_id
  subscription_id         = var.subscription_id
  resource_group_name     = var.resource_group_name_us2
  resource_group_location = var.resource_group_location_us2
  appgw_pip_name          = var.appgw_pip_name_us2
  appgw_pip_allocation    = var.appgw_pip_allocation_us2
  appgw_name              = var.appgw_name_us2
  appgw_sku_name          = var.appgw_sku_name_us2
  appgw_sku_tier          = var.appgw_sku_tier_us2
  appgw_sku_capacity      = var.appgw_sku_capacity_us2
  appgw_ip_config_name    = var.appgw_ip_config_name_us2
  subnet_id               = var.subnet_id_us2 #module.eu_gl_virtualNetwork.subnet_name[1]
  #WAF Configurations
  waf_enabled                  = var.waf_enabled
  waf_firewall_mode            = var.waf_firewall_mode
  waf_rule_set_type            = var.waf_rule_set_type
  waf_rule_set_version         = var.waf_rule_set_version
  waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
  waf_request_body_check       = var.waf_request_body_check
  waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
  depends_on = [ module.us2_gl_rg, module.us2_gl_virtualNetwork ]
}