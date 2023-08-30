module "gl_appgw" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.3"
  tenant_id               = var.tenant_id
  subscription_id         = var.subscription_id
  resource_group_name     = var.resource_group_name_eu
  resource_group_location = var.resource_group_location_eu
  appgw_pip_name          = var.appgw_pip_name
  appgw_pip_allocation    = var.appgw_pip_allocation
  appgw_name              = var.appgw_name
  appgw_sku_name          = var.appgw_sku_name
  appgw_sku_tier          = var.appgw_sku_tier
  appgw_sku_capacity      = var.appgw_sku_capacity
  appgw_ip_config_name    = var.appgw_ip_config_name
  subnet_id               = local.subnet_id
  #WAF Configurations
  waf_enabled                  = var.waf_enabled
  waf_firewall_mode            = var.waf_firewall_mode
  waf_rule_set_type            = var.waf_rule_set_type
  waf_rule_set_version         = var.waf_rule_set_version
  waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
  waf_request_body_check       = var.waf_request_body_check
  waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
}