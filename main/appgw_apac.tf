# module "apac_gl_appgw" {
#   source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.17"
#   tenant_id               = var.subscription.nonprod.tenant_id
#   subscription_id         = var.subscription.nonprod.subscription_id
#   resource_group_name     = var.apac_vars.resource_group.resource_group_name
#   resource_group_location = var.apac_vars.resource_group.resource_group_location
#   appgw_pip_name          = var.apac_vars.app_gateway.appgw_pip_name
#   appgw_pip_allocation    = var.apac_vars.app_gateway.appgw_pip_allocation
#   appgw_name              = var.apac_vars.app_gateway.appgw_name
#   appgw_sku_name          = var.apac_vars.app_gateway.appgw_sku_name
#   appgw_sku_tier          = var.apac_vars.app_gateway.appgw_sku_tier
#   appgw_ip_config_name    = var.apac_vars.app_gateway.appgw_ip_config_name
#   subnet_frontend_id      = var.apac_vars.app_gateway.subnet_id
#   ssl_certificate_name    = var.apac_vars.app_gateway.ssl_certificate_name
#   key_vault_secret_id     = var.apac_vars.app_gateway.key_vault_secret_id
#   #trusted_root_certificate_id = var.apac_vars.app_gateway.trusted_root_certificate_id
#   # hostname                = var.apac_vars.app_gateway.hostname
#   api_hostname          = var.apac_vars.app_gateway.api_hostname
#   origin_api_hostname   = var.apac_vars.app_gateway.origin_api_hostname
#   mgmt_hostname         = var.apac_vars.app_gateway.mgmt_hostname
#   origin_mgmt_hostname  = var.apac_vars.app_gateway.origin_mgmt_hostname
#   apim_address_pool     = var.apac_vars.app_gateway.apim_address_pool
#   user_managed_identity = var.apac_vars.app_gateway.user_managed_identity
#   #WAF Configurations
#   waf_enabled                  = var.waf_enabled
#   waf_firewall_mode            = var.waf_firewall_mode
#   waf_rule_set_type            = var.waf_rule_set_type
#   waf_rule_set_version         = var.waf_rule_set_version
#   waf_file_upload_limit_mb     = var.waf_file_upload_limit_mb
#   waf_request_body_check       = var.waf_request_body_check
#   waf_max_request_body_size_kb = var.waf_max_request_body_size_kb
#   depends_on                   = [module.eu_gl_rg]
# }