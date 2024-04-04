resource "azurerm_container_registry" "acr" {
  name                = var.eu_vars.acr.acr_name
  resource_group_name = var.eu_vars.resource_group.resource_group_name
  location            = var.eu_vars.resource_group.resource_group_location
  sku                 = var.eu_vars.acr.acr_sku
  admin_enabled       = var.eu_vars.acr.acr_admin_enabled
  depends_on          = [module.eu_gl_rg]
}