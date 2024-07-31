resource "azurerm_role_assignment" "rg_prd_dash" {
  count                = terraform.workspace == "prod" ? 1 : 0
  principal_id         = data.azuread_group.ad_groups["CSA-AAD-PRJ-Concent-SRE-Write"].object_id
  scope                = data.azurerm_resource_group.prod_dash[0].id
  role_definition_name = "Contributor"
  principal_type       = "Group"
}

resource "azurerm_role_assignment" "rg_prd_monitor" {
  count                = terraform.workspace == "prod" ? 1 : 0
  principal_id         = data.azuread_group.ad_groups["CSA-AAD-PRJ-Concent-SRE-Write"].object_id
  scope                = data.azurerm_resource_group.prod_dash[0].id
  role_definition_name = "Monitoring Contributor"
  principal_type       = "Group"
}

resource "azurerm_role_assignment" "rg_prd_read" {
  count                = terraform.workspace == "prod" ? 1 : 0
  principal_id         = data.azuread_group.ad_groups["CSA-AAD-PRJ-ELX-Concent-Claim-Reader"].object_id
  scope                = data.azurerm_resource_group.prod_dash[0].id
  role_definition_name = "Reader"
  principal_type       = "Group"
}

data "azurerm_resource_group" "prod_dash" {
  count = terraform.workspace == "prod" ? 1 : 0
  name  = "RG-ELX-GL-CDI-XO-ProductDashboards-Prod"
}