module "eu_gl_appgw" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.6"
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
  subnet_frontend_id      = "/subscriptions/${var.subscription_id}/resourceGroups/${resource_group_name_eu}/providers/Microsoft.Network/virtualNetworks/${virtual_network_name_eu}/subnets/Subnet-fe"
  ssl_certificate_name    = var.ssl_certificate_name
  key_vault_secret_id = var.key_vault_secret_id
  hostname = var.hostname
  apim_address_pool = var.apim_address_pool_eu
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
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.6"
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
  subnet_frontend_id      = "/subscriptions/${var.subscription_id}/resourceGroups/${resource_group_name_us}/providers/Microsoft.Network/virtualNetworks/${virtual_network_name_us}/subnets/Subnet-fe"
  ssl_certificate_name    = var.ssl_certificate_name
  key_vault_secret_id = var.key_vault_secret_id
  hostname = var.hostname
  apim_address_pool = var.apim_address_pool_us
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
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-AppGw//module?ref=v0.0.6"
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
  subnet_frontend_id      = "/subscriptions/${var.subscription_id}/resourceGroups/${resource_group_name_us2}/providers/Microsoft.Network/virtualNetworks/${virtual_network_name_us2}/subnets/Subnet-fe"
  ssl_certificate_name    = var.ssl_certificate_name
  key_vault_secret_id = var.key_vault_secret_id
  hostname = var.hostname
  apim_address_pool = var.apim_address_pool_us2
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