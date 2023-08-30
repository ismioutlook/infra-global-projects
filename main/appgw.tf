module "gl_appgw" {
  source                          = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw?ref=v0.0.2"
  tenant_id                       = var.tenant_id
  subscription_id                 = var.subscription_id
  resource_group_name             = var.resource_group_name
  resource_group_location         = var.resource_group_location
  appgw_vnet_name                 = var.appgw_vnet_name
  appgw_sn_frontend_name          = var.appgw_sn_frontend_name
  appgw_sn_frontend_address_space = var.appgw_sn_frontend_address_space
  appgw_sn_backend_name           = var.appgw_sn_backend_name
  appgw_sn_backend_address_space  = var.appgw_sn_backend_address_space
  appgw_pip_name                  = var.appgw_pip_name
  appgw_pip_allocation            = var.appgw_pip_allocation
  appgw_name                      = var.appgw_name
  appgw_sku_name                  = var.appgw_sku_name
  appgw_sku_tier                  = var.appgw_sku_tier
  #appgw_sku_capacity              = var.appgw_sku_capacity
  appgw_ip_config_name = var.appgw_ip_config_name
  #WAF Configurations
  waf_enabled                  = var.waf_enabled
  waf_firewall_mode            = var.waf_firewall_mode
  waf_rule_set_type            = var.waf_rule_set_type
  waf_rule_set_version         = var.waf_rule_set_version
  waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
  waf_request_body_check       = var.waf_request_body_check
  waf_max_request_body_size_kb = var.waf_max_request_body_size_kb

}