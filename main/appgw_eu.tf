# module "eu_gl_appgw" {
#   source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.15.1"
#   tenant_id               = var.subscription.subscription.tenant_id
#   subscription_id         = var.subscription.subscription.subscription_id
#   resource_group_name     = var.eu_vars.resource_group.resource_group_name
#   resource_group_location = var.eu_vars.resource_group.resource_group_location
#   appgw_pip_name          = var.eu_vars.app_gateway.appgw_pip_name
#   appgw_pip_allocation    = var.eu_vars.app_gateway.appgw_pip_allocation
#   appgw_name              = var.eu_vars.app_gateway.appgw_name
#   appgw_sku_name          = var.eu_vars.app_gateway.appgw_sku_name
#   appgw_sku_tier          = var.eu_vars.app_gateway.appgw_sku_tier
#   appgw_ip_config_name    = var.eu_vars.app_gateway.appgw_ip_config_name
#   subnet_frontend_id      = var.eu_vars.app_gateway.subnet_id
#   ssl_certificate_name    = var.eu_vars.app_gateway.ssl_certificate_name
#   key_vault_secret_id     = var.eu_vars.app_gateway.key_vault_secret_id
#   #trusted_root_certificate_id = var.eu_vars.app_gateway.trusted_root_certificate_id
#   # hostname                = var.eu_vars.app_gateway.hostname
#   api_hostname           = var.eu_vars.app_gateway.api_hostname
#   origin_api_hostname    = var.eu_vars.app_gateway.origin_api_hostname
#   mgmt_hostname          = var.eu_vars.app_gateway.mgmt_hostname
#   portal_hostname        = var.eu_vars.app_gateway.portal_hostname
#   origin_portal_hostname = var.eu_vars.app_gateway.origin_portal_hostname
#   origin_mgmt_hostname   = var.eu_vars.app_gateway.origin_mgmt_hostname
#   origin_scm_hostname    = var.eu_vars.app_gateway.origin_scm_hostname
#   scm_hostname           = var.eu_vars.app_gateway.scm_hostname
#   apim_address_pool      = var.eu_vars.app_gateway.apim_address_pool
#   user_managed_identity  = var.eu_vars.app_gateway.user_managed_identity
#   #WAF Configurations
#   waf_enabled                  = var.waf_enabled
#   waf_firewall_mode            = var.waf_firewall_mode
#   waf_rule_set_type            = var.waf_rule_set_type
#   waf_rule_set_version         = var.waf_rule_set_version
#   waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
#   waf_request_body_check       = var.waf_request_body_check
#   waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
#   depends_on                   = [module.eu_gl_rg, module.apim-multi-location]
# }