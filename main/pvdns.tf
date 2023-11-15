# #--------------------------------------EU Private DNS------------------------------------------------------------
# resource "azurerm_private_dns_zone" "eu_private_dns" {
#   name                = "eluxcdn.com"
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
# }


# resource "azurerm_private_dns_a_record" "eu_apim_record" {
#   for_each            = { for idx, record in var.eu_vars.dns_records : idx => record }
#   name                = each.value.name
#   zone_name           = azurerm_private_dns_zone.eu_private_dns.name
#   resource_group_name = var.eu_vars.resource_group.resource_group_name
#   ttl                 = each.value.ttl
#   records             = each.value.records
# }

# #--------------------------------------US Private DNS------------------------------------------------------------
# resource "azurerm_private_dns_zone" "us_private_dns" {
#   name                = "electrolux.com"
#   resource_group_name = var.us_vars.resource_group.resource_group_name
# }


# resource "azurerm_private_dns_a_record" "us_apim_record" {
#   for_each            = { for idx, record in var.us_vars.dns_records : idx => record }
#   name                = each.value.name
#   zone_name           = azurerm_private_dns_zone.us_private_dns.name
#   resource_group_name = var.us_vars.resource_group.resource_group_name
#   ttl                 = each.value.ttl
#   records             = each.value.records
# }