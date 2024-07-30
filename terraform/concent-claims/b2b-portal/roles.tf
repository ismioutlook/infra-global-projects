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

  role_assignments_for_scopes = {
    example1 = {
      scope = module.rg[0].id
      role_assignments = {
        role_assignment_1 = {
          role_definition = "reader"
          groups          = ["my-group-1"]
        }
      }
    }
    example2 = {
      scope = module.logic_apps[0].app_service_plan_id
      role_assignments = {
        role_assignment_1 = {
          role_definition = "logic_app_contributor"
          groups          = ["my-group-1"]
        }
      }
    }
  }


  depends_on = [module.sa, module.logic_apps]
}