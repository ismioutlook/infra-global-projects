# ---------------------------------------------------------------------------------------------------------------------
# COMMON TERRAGRUNT CONFIGURATION
# This is the common component configuration for AKS cluster. The common variables for each environment to
# deploy AKS are defined here. This configuration will be merged into the environment configuration
# via an include block.
# ---------------------------------------------------------------------------------------------------------------------

locals {
  subscription_vars = read_terragrunt_config(find_in_parent_folders("subscription.hcl"))
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  # Extract out common variables for reuse
  subscription_ref_name = local.subscription_vars.locals.subscription_ref_name
  env                   = local.environment_vars.locals.environment
  location              = local.region_vars.locals.location

  # Expose the base source URL so different versions of the module can be deployed in different environments. This will
  # be used to construct the source URL in the child terragrunt configurations.
  #base_source_url = "${get_repo_root()}//modules/aks"
  base_source_url = "git@ssh.dev.azure.com:v3/ELX-Marketing-DevOps/infra-modules/terraform-azurerm-aks//.?ref=7c96f62973fc4550f37c46ee3e65382625514244"
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module. This defines the parameters that are common across all
# environments.
# ---------------------------------------------------------------------------------------------------------------------
inputs = {
  cluster_name_random_suffix  = true
  kubernetes_version          = "1.29.4"
  agents_availability_zones   = ["1", "2", "3"]
  temporary_name_for_rotation = "temp"
  sku_tier                    = "Standard"
  os_disk_size_gb             = 120
  enable_auto_scaling         = true

  network_plugin           = "azure"
  network_policy           = "azure"
  network_plugin_mode      = "overlay"
  net_profile_service_cidr = "10.0.32.0/20"
  # Network profile
  net_profile_dns_service_ip = "10.0.32.10"

  oidc_issuer_enabled = true

  azure_policy_enabled = true

  # Default node pool
  agents_pool_name                    = "agentpool"
  agents_count                        = 1
  agents_size                         = "Standard_D4s_v3"
  agents_min_count                    = 1
  agents_max_count                    = 5
  agents_max_pods                     = 250
  private_cluster_public_fqdn_enabled = false
  only_critical_addons_enabled        = true
  enable_node_public_ip               = false
  private_cluster_enabled             = true
  image_cleaner_enabled               = true

  key_vault_secrets_provider_enabled = true

  net_profile_pod_cidr = "192.168.0.0/16"
  load_balancer_sku    = "standard"

  local_account_disabled = true

  workload_autoscaler_profile = {
    keda_enabled = true
  }

  workload_identity_enabled = true
  aks_builtin_role_assignments = {
    "Azure Kubernetes Service RBAC Cluster Admin" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-PE-Admin"]
    }

    "Azure Kubernetes Service Cluster User Role" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-PE-Read", "CSA-AAD-PRJ-Concent-ONL-Read", "CSA-AAD-PRJ-Concent-SRE-Read", "CSA-AAD-PRJ-Concent-SRPartner",
        "CSA-AAD-PRJ-Concent-ODL-Developer", "CSA-AAD-PRJ-Concent-SHAb-Developer", "CSA-AAD-PRJ-Concent-SRE-Write",
        "CSA-AAD-PRJ-Concent-SRDirect", "CSA-AAD-PRJ-Concent-Developer",
      "CSA-AAD-PRJ-Concent-SHAg-Developer"]
    }

    "Azure Kubernetes Service RBAC Reader" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-PE-Read", "CSA-AAD-PRJ-Concent-ONL-Read", "CSA-AAD-PRJ-Concent-SRE-Read", "CSA-AAD-PRJ-Concent-SRPartner",
        "CSA-AAD-PRJ-Concent-ODL-Developer", "CSA-AAD-PRJ-Concent-SHAb-Developer",
        "CSA-AAD-PRJ-Concent-SRDirect", "CSA-AAD-PRJ-Concent-Developer",
      "CSA-AAD-PRJ-Concent-SHAg-Developer"]
    }

    "Azure Kubernetes Service RBAC Writer" = {
      principal_group_names = ["CSA-AAD-PRJ-Concent-SRE-Write"]
    }
  }

  enable_fluxcd                         = true
  fluxcd_scope                          = "cluster"
  fluxcd_git_repository_url             = "https://ELX-Marketing-DevOps@dev.azure.com/ELX-Marketing-DevOps/platform-engineering-stack/_git/aks-clusters-conf"
  fluxcd_git_repository_reference_type  = "branch"
  fluxcd_git_repository_reference_value = "private-cluster"

  fluxcd_git_repository_sync_interval_in_seconds = 60
  fluxcd_git_repository_timeout_in_seconds       = 60

  fluxcd_kustomizations = [{
    name                      = "cluster"
    path                      = format("./clusters/%s/%s/%s", local.subscription_ref_name, local.location, local.env)
    sync_interval_in_seconds  = 30
    retry_interval_in_seconds = 30
  }]
}
