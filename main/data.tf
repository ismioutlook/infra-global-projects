data "azurerm_subnet" "subnet_apim" {
  name                 = var.eu_vars.virtual_network.apim_subnet_name
  resource_group_name  = var.eu_vars.virtual_network.vnet_resource_group_name
  virtual_network_name = var.eu_vars.virtual_network.virtual_network_name
}

data "azurerm_subnet" "subnet_appgw" {
  name                 = var.eu_vars.virtual_network.appgw_subnet_name
  resource_group_name  = var.eu_vars.virtual_network.vnet_resource_group_name
  virtual_network_name = var.eu_vars.virtual_network.virtual_network_name
}

data "azurerm_subnet" "subnet_aks" {
  name                 = var.eu_vars.virtual_network.aks_subnet_name
  resource_group_name  = var.eu_vars.virtual_network.vnet_resource_group_name
  virtual_network_name = var.eu_vars.virtual_network.virtual_network_name
}

data "azurerm_subnet" "subnet_pv_endpoints" {
  name                 = var.eu_vars.virtual_network.pv_endpoint_subnet_name
  resource_group_name  = var.eu_vars.virtual_network.vnet_resource_group_name
  virtual_network_name = var.eu_vars.virtual_network.virtual_network_name
}

data "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_vars.azure_k8s_service.cluster_name1
  resource_group_name = var.eu_vars.resource_group.resource_group_name
}

data "azuread_group" "ad_groups" {
  for_each     = toset(local.principal_group_names)
  display_name = each.value
}