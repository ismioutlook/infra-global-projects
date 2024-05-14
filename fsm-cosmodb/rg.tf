module "fsm-rg" {
  count                   = terraform.workspace == "dev" ? 1 : 0
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.7"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  #Tags
  owner_tag        = var.owner_tag
  account_tag      = var.account_tag
  billingid_tag    = var.billingid_tag
  costcenterit_tag = var.costcenterit_tag
  sector_tag       = var.sector_tag
  env_tag          = var.env_tag
  #created_by_tag   = var.created_by_tag
}
moved {
  from = module.fsm-rg.azurerm_resource_group.rg
  to   = module.fsm-rg[0].azurerm_resource_group.rg
}

