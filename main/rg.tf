module "rg" {
  source              = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.4"
  resource_group_name = var.resource_group_name1
  resource_group_location = var.resource_group_location1
}

module "rg" {
  source              = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.4"
  resource_group_name = var.resource_group_name2
  resource_group_location = var.resource_group_location2

module "rg" {
  source              = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg//module?ref=v0.0.4"
  resource_group_name = var.resource_group_name3
  resource_group_location = var.resource_group_locatio3
}