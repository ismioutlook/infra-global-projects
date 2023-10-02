#--------------------------------------US Private DNS------------------------------------------------------------
resource "azurerm_private_dns_zone" "eu_private_dns" {
  name                = "nonprod.electrolux.com"
  resource_group_name = var.eu_vars.resource_group.resource_group_name
}


resource "azurerm_private_dns_a_record" "eu_apim_record" {
  for_each = {for idx, record in var.eu_vars.dns_records: idx => record}
  name                = each.value.name
  zone_name           = azurerm_private_dns_zone.eu_private_dns.name
  resource_group_name = var.eu_vars.resource_group.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
}

# resource "azurerm_private_dns_a_record" "eu_origin_api_record" {
#   name                = "origin-api"
#   zone_name           = azurerm_private_dns_zone.eu_private_dns.name
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
#   ttl                 = 1
#   records             = ["20.229.95.27"]
# }

# resource "azurerm_private_dns_a_record" "eu_portal_record" {
#   name                = "portal"
#   zone_name           = azurerm_private_dns_zone.eu_private_dns.name
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
#   ttl                 = 60
#   records             = ["10.216.3.6"]
# }

# resource "azurerm_private_dns_a_record" "eu_origin_portal_record" {
#   name                = "origin-portal"
#   zone_name           = azurerm_private_dns_zone.eu_private_dns.name
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
#   ttl                 = 1
#   records             = ["20.229.95.27"]
# }

# resource "azurerm_private_dns_a_record" "eu_management_record" {
#   name                = "management"
#   zone_name           = azurerm_private_dns_zone.eu_private_dns.name
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
#   ttl                 = 60
#   records             = ["10.216.3.6"]
# }

# resource "azurerm_private_dns_a_record" "eu_origin_management_record" {
#   name                = "origin-management"
#   zone_name           = azurerm_private_dns_zone.eu_private_dns.name
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
#   ttl                 = 60
#   records             = ["20.229.95.27"]
# }

# resource "azurerm_private_dns_a_record" "eu_scm_record" {
#   name                = "scm"
#   zone_name           = azurerm_private_dns_zone.eu_private_dns.name
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
#   ttl                 = 60
#   records             = ["10.216.3.6"]
# }

# resource "azurerm_private_dns_a_record" "eu_origin_scm_record" {
#   name                = "origin-scm"
#   zone_name           = azurerm_private_dns_zone.eu_private_dns.name
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
#   ttl                 = 60
#   records             = ["20.229.95.27"]
# }

# #--------------------------------------US Private DNS------------------------------------------------------------
# resource "azurerm_private_dns_zone" "us_private_dns" {
#   name                = "nonprod.electrolux.com"
#   resource_group_name = var.us_vars.resource_group.resource_group_name
# }

# resource "azurerm_private_dns_a_record" "us_api_record" {
#   name                = "api"
#   zone_name           = azurerm_private_dns_zone.us_private_dns.name
#   resource_group_name = var.us_vars.resource_group.resource_group_name
#   ttl                 = 60
#   records             = ["10.217.3.6"]
# }

# #--------------------------------------US2 Private DNS------------------------------------------------------------
# resource "azurerm_private_dns_zone" "us2_private_dns" {
#   name                = "nonprod.electrolux.com"
#   resource_group_name = var.us2_vars.resource_group.resource_group_name
# }

# resource "azurerm_private_dns_a_record" "us2_api_record" {
#   name                = "api"
#   zone_name           = azurerm_private_dns_zone.us2_private_dns.name
#   resource_group_name = var.us2_vars.resource_group.resource_group_name
#   ttl                 = 60
#   records             = ["10.218.3.6"]
# }