module "adf-pe" {
  count          = var.enabled ? 1 : 0
  name           = "pl-VN-ELX-GL-Concent-NonProd-Spoke-001-01"
  source         = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-module-pe?ref=496689fbec74fa3fe375f89d45d6bd47d8a8dbbe"
  resource_group = module.rg[0].name
  location       = module.rg[0].location
  service_connection = {
    name         = "pl-VN-ELX-GL-Concent-NonProd-Spoke-001-01"
    resource_id  = module.adf[0].data_factory_id
    subresources = ["portal"]
  }
  private_dns_zone = {
    dns = {
      name = "c4creplica"
      ids  = [module.dz[0].resource_id]

    }
  }
  snet_id = var.subnet_id
}

module "sql-pe" {
  source         = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-module-pe?ref=496689fbec74fa3fe375f89d45d6bd47d8a8dbbe"
  name           = "pl-VN-ELX-GL-Concent-NonProd-Spoke-001-02"
  resource_group = module.rg[0].name
  location       = module.rg[0].location
  private_dns_zone = {
    # dns = {
    name = "c4creplica"
    ids  = [module.dz[0].resource_id]

    # }
  }
  service_connection = {
    name         = "pl-VN-ELX-GL-Concent-NonProd-Spoke-001-02"
    resource_id  = module.sql[0].sql_server.id
    subresources = ["sqlServer"]
  }
  snet_id = var.subnet_id
}

