locals {

  groups_by_display_name = {
    my-group-1 = "CSA-AAD-PRJ-ELX-Concent-Claim-Developer"
  }

}
module "role_assignments" {
  count   = var.enabled ? 1 : 0
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "v0.0.1"
  role_definitions = {
    reader                = "Reader"
    logic_app_contributor = "Logic App Contributor"
  }

  groups_by_display_name = local.groups_by_display_name
  role_assignments_for_resource_groups = {
    example1 = {
      resource_group_name = module.rg[0].name

      role_assignments = {
        role_assignment_1 = {
          role_definition = "reader"
          groups = [
            "my-group-1"
          ]
        }
      }
    }
  }

  role_assignments_for_resources = {
    example1 = {
      resource_name       = var.logic_app_name
      resource_group_name = module.rg[0].name
      role_assignments = {
        role_assignment_1 = {
          role_definition = "logic_app_contributor"
          groups = [
            "my-group-1"
          ]
        }
      }
    }

  }
  depends_on = [module.sa, module.logic_apps]
}