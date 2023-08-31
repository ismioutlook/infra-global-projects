module "eu_gl_aks" {
  source                  = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/infra-mod-aks//module?ref=v0.0.8"
  resource_group_name     = var.resource_group_name_eu
  resource_group_location = var.resource_group_location_eu
  log_analytics_name      = var.log_analytics_name
  la_sku                  = var.la_sku
  la_solution_name        = var.la_solution_name
  cluster_name            = var.cluster_name
  kubernetes_version      = var.kubernetes_version
  pod_security_policy     = var.pod_security_policy
  # Default node pool
  node_count          = var.node_count
  node_vm_size        = var.node_vm_size
  os_disk_size_gb     = var.os_disk_size_gb
  vnet_subnet_id      = var.aks_subnet_id
  enable_auto_scaling = var.enable_auto_scaling
  node_min_count      = var.node_min_count
  node_max_count      = var.node_max_count
  node_max_pods       = var.node_max_pods
  node_taints         = var.node_taints
  node_labels         = var.node_labels
  node_pools          = var.node_pools
  # Network profile
  network_plugin     = var.network_plugin
  network_policy     = var.network_policy
  pod_cidr           = var.pod_cidr
  service_cidr       = var.service_cidr
  dns_service_ip     = var.dns_service_ip
  docker_bridge_cidr = var.docker_bridge_cidr

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


  # Tags
  owner_tag        = var.owner_tag
  account_tag      = var.account_tag
  billingid_tag    = var.billingid_tag
  costcenterit_tag = var.costcenterit_tag
  sector_tag       = var.sector_tag
  env_tag          = var.env_tag

}
