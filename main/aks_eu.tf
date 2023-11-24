module "eu_gl_aks" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-aks//module?ref=v0.0.12"
  resource_group_name     = var.eu_vars.resource_group.resource_group_name
  resource_group_location = var.eu_vars.resource_group.resource_group_location
  log_analytics_name      = var.aks_vars.azure_k8s_service.log_analytics_name
  la_sku                  = var.aks_vars.azure_k8s_service.la_sku
  la_solution_name        = var.aks_vars.azure_k8s_service.la_solution_name
  cluster_name            = var.aks_vars.azure_k8s_service.cluster_name1
  kubernetes_version      = var.aks_vars.azure_k8s_service.kubernetes_version
  pod_security_policy     = var.aks_vars.azure_k8s_service.pod_security_policy
  sku_tier                = var.aks_vars.azure_k8s_service.sku_tier
  # Default node pool
  node_count               = var.aks_vars.azure_k8s_service.node_count
  node_vm_size             = var.aks_vars.azure_k8s_service.node_vm_size
  os_disk_size_gb          = var.aks_vars.azure_k8s_service.os_disk_size_gb
  aks_subnet_id            = var.aks_vars.azure_k8s_service.aks_subnet_id_eu
  enable_auto_scaling      = var.aks_vars.azure_k8s_service.enable_auto_scaling
  node_min_count           = var.aks_vars.azure_k8s_service.node_min_count
  node_max_count           = var.aks_vars.azure_k8s_service.node_max_count
  node_max_pods            = var.aks_vars.azure_k8s_service.node_max_pods
  node_taints              = var.aks_vars.azure_k8s_service.node_taints
  node_labels              = var.aks_vars.azure_k8s_service.node_labels
  node_pools               = var.node_pools
  node_resource_group_name = var.aks_vars.azure_k8s_service.node_resource_group_name_eu
  # Network profile
  network_plugin     = var.aks_vars.azure_k8s_service.network_plugin
  network_policy     = var.aks_vars.azure_k8s_service.network_policy
  pod_cidr           = var.aks_vars.azure_k8s_service.pod_cidr
  service_cidr       = var.aks_vars.azure_k8s_service.service_cidr
  dns_service_ip     = var.aks_vars.azure_k8s_service.dns_service_ip
  docker_bridge_cidr = var.aks_vars.azure_k8s_service.docker_bridge_cidr

  # Autoscaler profile
  balance_similar_node_groups      = var.balance_similar_node_groups
  max_graceful_termination_sec     = var.max_graceful_termination_sec
  scan_interval                    = var.scan_interval
  scale_down_delay_after_add       = var.scale_down_delay_after_add
  scale_down_delay_after_delete    = var.scale_down_delay_after_delete
  scale_down_delay_after_failure   = var.scale_down_delay_after_failure
  scale_down_unneeded              = var.scale_down_unneeded
  scale_down_unready               = var.scale_down_unready
  scale_down_utilization_threshold = var.scale_down_utilization_threshold
  depends_on                       = [module.eu_gl_rg]

  # user Node pool

  user_os_disk_size_gb     = var.aks_vars.azure_k8s_service.user_os_disk_size_gb
  user_node_vm_size        = var.aks_vars.azure_k8s_service.user_node_vm_size
  user_node_count          = var.aks_vars.azure_k8s_service.user_node_count
  user_enable_auto_scaling = var.aks_vars.azure_k8s_service.user_enable_auto_scaling
  user_node_min_count      = var.aks_vars.azure_k8s_service.user_node_min_count
  user_node_max_count      = var.aks_vars.azure_k8s_service.user_node_max_count
  user_node_max_pods       = var.aks_vars.azure_k8s_service.user_node_max_pods
  user_node_taints         = var.aks_vars.azure_k8s_service.user_node_taints
  user_node_labels         = var.aks_vars.azure_k8s_service.user_node_labels
  # Tags
  owner_tag        = var.eu_vars.tags.owner_tag
  account_tag      = var.eu_vars.tags.account_tag
  billingid_tag    = var.eu_vars.tags.billingid_tag
  costcenterit_tag = var.eu_vars.tags.costcenterit_tag
  sector_tag       = var.eu_vars.tags.sector_tag
  env_tag          = var.eu_vars.tags.env_tag
}