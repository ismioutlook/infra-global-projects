locals {

  users_by_user_principal_name = {
    my-user-1 = "michal.hornak@electrolux.com"
    my-user-2 = "anindya.chakraborty@electrolux.com"
    my-user-3 = "victor.zadiran@electrolux.com"
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

  users_by_user_principal_name = local.users_by_user_principal_name
  role_assignments_for_resource_groups = {
    example1 = {
      resource_group_name = module.rg[0].name

      role_assignments = {
        role_assignment_1 = {
          role_definition = "reader"
          users = [
            "my-user-1",
            "my-user-2",
            "my-user-3"
          ]
        }
      }
    }
  }

  role_assignments_for_resources = {
    example1 = {
      resource_name       = module.logic_apps.logic_app_name
      resource_group_name = module.rg[0].name
      role_assignments = {
        role_assignment_1 = {
          role_definition = "logic_app_contributor"
          users = [
            "my-user-1",
            "my-user-2",
            "my-user-3"
          ]
        }
      }
    }

  }
  depends_on = [module.sa, module.logic_apps]
}