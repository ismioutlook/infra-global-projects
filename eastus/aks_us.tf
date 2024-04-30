module "us_gl_aks" {
  source                     = "Azure/aks/azurerm"
  version                    = "8.0.0"
  resource_group_name        = var.resource_group_name
  cluster_name               = var.cluster_name
  cluster_name_random_suffix = true
  prefix                     = var.cluster_name
  kubernetes_version         = var.kubernetes_version
  sku_tier                   = var.sku_tier
  os_disk_size_gb            = var.os_disk_size_gb
  enable_auto_scaling        = var.enable_auto_scaling
  # resource_group_location = var.us_vars.resource_group.resource_group_location
  log_analytics_workspace_enabled      = true
  cluster_log_analytics_workspace_name = var.cluster_log_analytics_workspace_name
  log_analytics_workspace_sku          = var.log_analytics_workspace_sku

  # pod_security_policy     = var.us_vars.azure_k8s_service.pod_security_policy
  azure_policy_enabled = true
  # Default node pool
  agents_count                 = var.agents_count
  agents_size                  = var.agents_size
  vnet_subnet_id               = var.vnet_subnet_id
  agents_pool_name             = "agentpool"
  agents_min_count             = var.agents_min_count
  agents_max_count             = var.agents_max_count
  agents_max_pods              = var.agents_max_pods
  agents_taints                = var.agents_taints
  only_critical_addons_enabled = true
  enable_node_public_ip        = false

  agents_labels = var.agents_labels
  # node_pools               = var.node_pools
  node_resource_group = var.node_resource_group
  # Network profile
  network_plugin = var.network_plugin
  network_policy = var.network_policy
  # net_profile_pod_cidr           = var.us_vars.azure_k8s_service.pod_cidr
  net_profile_service_cidr   = var.net_profile_service_cidr
  net_profile_dns_service_ip = var.net_profile_dns_service_ip
  load_balancer_sku          = "standard"
  # docker_bridge_cidr = var.us_vars.azure_k8s_service.docker_bridge_cidr

  # Autoscaler profile
  auto_scaler_profile_balance_similar_node_groups      = var.balance_similar_node_groups
  auto_scaler_profile_max_graceful_termination_sec     = var.max_graceful_termination_sec
  auto_scaler_profile_scan_interval                    = var.scan_interval
  auto_scaler_profile_scale_down_delay_after_add       = var.scale_down_delay_after_add
  auto_scaler_profile_scale_down_delay_after_delete    = var.scale_down_delay_after_delete
  auto_scaler_profile_scale_down_delay_after_failure   = var.scale_down_delay_after_failure
  auto_scaler_profile_scale_down_unneeded              = var.scale_down_unneeded
  auto_scaler_profile_scale_down_unready               = var.scale_down_unready
  auto_scaler_profile_scale_down_utilization_threshold = var.scale_down_utilization_threshold
  # depends_on                       = [module.us_gl_rg]
  rbac_aad                          = true
  role_based_access_control_enabled = true
  rbac_aad_managed                  = true
  rbac_aad_admin_group_object_ids   = ["8f7b1680-abdf-4e5c-952c-2312fb6d3e6b", "c3792821-b067-40d8-8399-b1d9842a3ced", "75f9a0c1-6e61-4cbe-beba-9ab39034b9a0"]
  rbac_aad_azure_rbac_enabled       = true

  # user Node pool
  node_pools = {
    "userpool" = {
      name                  = "userpool"
      vm_size               = "Standard_DS2_v2"
      node_count            = 1
      vnet_subnet_id        = var.vnet_subnet_id
      os_disk_size_gb       = 128
      enable_auto_scaling   = true
      min_count             = 1
      max_count             = 2
      max_pods              = 30
      create_before_destroy = true
      zones                 = ["1", "2", "3"]
      node_taints           = []
      node_labels = {
        "mode" = "user"
      }
    }
  }
  tags = var.tags
}

resource "azurerm_role_assignment" "aks_cluster_user_role" {
  scope                = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourcegroups/RG-GL-ELX-EUS-NonProd-02/providers/Microsoft.ContainerService/managedClusters/AKS-MSS-NonProd-NA-0268e2"
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = "d79194c9-4c6d-4c8c-aa12-9b17bacddc34"
  principal_type       = "Group"
}

# resource "azurerm_role_assignment" "aks_cluster_rbac_reader" {
#   scope                = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourcegroups/RG-GL-ELX-EUS-NonProd-02/providers/Microsoft.ContainerService/managedClusters/AKS-MSS-NonProd-NA-0268e2"
#   role_definition_name = "Azure Kubernetes Service RBAC Reader"
#   principal_id         = "d79194c9-4c6d-4c8c-aa12-9b17bacddc34"
#   principal_type = "Group"
# }