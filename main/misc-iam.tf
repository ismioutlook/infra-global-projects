resource "azurerm_role_assignment" "rg_prd_dash" {
  count                = terraform.workspace == "prod" ? 1 : 0
  principal_id         = data.azuread_group.ad_groups["CSA-AAD-PRJ-Concent-SRE-Write"].object_id
  scope                = "/subscriptions/9a44d85a-3cf1-4938-9509-c8f94b1aee10/resourceGroups/RG-ELX-GL-CDI-XO-ProductDashboards-Prod"
  role_definition_name = "Contributor"
  principal_type       = "Group"
}