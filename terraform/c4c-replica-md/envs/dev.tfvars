enabled                    = true
resource_group_name        = "RG-GL-c4c-replica-Dev"
location                   = "westeurope"
key_vault_name             = "elxkv-c4c-dev-westeu001"
soft_delete_retention_days = 90
kv_sku_name                = "standard"
adf_name                   = "elxa2df-c4creplica-dev001"
azure_devops_configuration = {
  account_name    = "ELX-Marketing-DevOps"
  branch_name     = "main"
  project_name    = "C4C-Replica-MD"
  repository_name = "adf-c4c-replica-md"
  root_folder     = "/"
}
dz_domain_name         = "c4creplicadev.azure.net"
subnet_id              = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-001/subnets/PV-ENDPOINTS-SBT-01"
machine_name           = "a2ws0001-c4cdev"
ip_configname          = "c4creplicadev-ipconfig"
network_interface_name = "a2ws0001-c4creplicadev-01"
sql_db_name            = "elxa2sqlmi-c4creplica-dev-001"
sql_srv_name           = "elxa2sql-c4creplica-dev-001"
virtual_network_links = {
  vnetlink1 = {
    vnetlinkname     = "vnetlink1"
    vnetid           = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-001"
    autoregistration = true

  }
}

