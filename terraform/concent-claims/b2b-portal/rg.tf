module "rg" {
  source              = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-rg?ref=8f04ff5d5862a0a1bdbcdc83aed79226f51042bc"
  name                = var.resource_group_name
  location            = var.resource_group_location
  ignore_tags_changes = var.ignore_tags_changes
  tags                = local.tags
}