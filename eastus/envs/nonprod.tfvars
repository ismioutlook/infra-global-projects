subscription = {
  subscription = {
    tenant_id       = "d2007bef-127d-4591-97ac-10d72fe28031"
    subscription_id = "4731e47d-991b-4fbd-86aa-1e861607b82f"
  }
}
tags = {
  environment  = "NonProd"
  owner        = "Arun Nalliannan"
  Account      = "623065"
  BillingID    = "Global"
  CostCenterIT = "10350645"
  Sector       = "East US"
}

#---------------------------------------------------EUS Vars group-------------------------------------------------------------------
resource_group_name     = "RG-GL-ELX-EUS-NonProd-02"
resource_group_location = "East US"
cluster_name            = "AKS-MSS-NonProd-NA-02"
kubernetes_version      = "1.28.5"
sku_tier                = "Standard"
os_disk_size_gb         = 120
enable_auto_scaling     = true
# cluster_name2           = "AKS-Global-US-NonProd"
# cluster_name3           = "AKS-Global-APAC-NonProd"
cluster_log_analytics_workspace_name = "LA-GL-WS-NonProd-EUS-02"
log_analytics_workspace_sku          = "PerGB2018"

agents_count     = 1
agents_size      = "Standard_D4s_v3"
agents_min_count = 1
agents_max_count = 5
agents_max_pods  = 60
agents_taints    = []
node_labels = {
  "service" = "microservices"
  "env"     = "nonprod"
  "project" = "mss"
  "mode"    = "system"
}
node_resource_group      = "RG-AKS-MSS-Node-Config-NonProd-NA-02"
network_plugin           = "azure"
network_policy           = "azure"
net_profile_service_cidr = "10.0.32.0/20"
# Network profile
net_profile_dns_service_ip = "10.0.32.10"
vnet_subnet_id             = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-EUS-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-EUS-Concent-NonProd-Spoke-001/subnets/AKS-SBT-01"
pod_cidr                   = "10.0.16.0/20"
docker_bridge_cidr         = "172.0.0.1/8"