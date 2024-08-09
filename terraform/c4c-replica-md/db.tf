resource "random_string" "db_password" {
  length  = 10
  special = false

}
module "sql" {
  count                  = var.enabled ? 1 : 0
  source                 = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-sql?ref=2146e49b7f3c6cf3d9a85ab6bcc2aa3fced78bd2"
  resource_group_name    = module.rg[0].name
  server_custom_name     = var.sql_srv_name
  location               = module.rg[0].location
  administrator_login    = "c4creplicaadmin"
  administrator_password = random_string.db_password.result
  databases = [{
    name = var.sql_db_name


  }]

}
