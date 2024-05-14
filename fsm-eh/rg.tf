module "fsm-prod-rg" {
  count                   = terraform.workspace == "prod" ? 1 : 0
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.7"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}