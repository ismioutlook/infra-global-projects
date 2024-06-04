module "logic_app" {
  count  = var.enabled ? 1 : 0
  source = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-logicapps"
}