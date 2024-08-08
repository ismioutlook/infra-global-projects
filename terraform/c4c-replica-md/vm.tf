module "testvm" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "0.15.1"

  enable_telemetry    = var.enable_telemetry
  location            = module.rg[0].location
  resource_group_name = module.rg[0].name
  os_type             = "Windows"
  name                = var.machine_name
  sku_size            = "Standard_DS3_v2"
  zone                = "1"

  generated_secrets_key_vault_secret_config = {
    key_vault_resource_id = module.kv[0].resource_id
  }

  source_image_reference = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter-Server-Core"
    version   = "latest"
  }

  network_interfaces = {
    network_interface_1 = {
      name = var.network_interface_name
      ip_configurations = {
        ip_configuration_1 = {
          name                          = "c4creplica-ipconfig1"
          private_ip_subnet_resource_id = var.subnet_id
        }
      }
    }
  }

  tags = local.tags

  depends_on = [
    module.kv
  ]
}