# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform and OpenTofu that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# Include the root `terragrunt.hcl` configuration. The root configuration contains settings that are common across all
# components and environments, such as how to configure remote state.
include "root" {
  path = find_in_parent_folders()
}

# Include the envcommon configuration for the component. The envcommon configuration contains settings that are common
# for the component across all environments.
include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/aks01cluster.hcl"
  # We want to reference the variables from the included config in this configuration, so we expose it.
  expose = true
}

locals {
  region_vars                          = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location                             = local.region_vars.locals.location
  aks_resource_group                   = "RG-GL-Concent-NonProd-AKS01-EU"
  cluster_name                         = "AKS-MSS-NonProd-EU-01"
  cluster_log_analytics_workspace_name = format("LA-%s", local.cluster_name)
  node_resource_group                  = format("RG-%s", local.cluster_name)
  vnet_subnet_id                       = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-NonProd-Networking/providers/Microsoft.Network/virtualNetworks/VN-ELX-GL-Concent-NonProd-Spoke-002/subnets/AKS-SBNT-001"
}

# Configure the version of the module to use in this environment. This allows to promote new versions one
# environment at a time.
terraform {
  source = "${include.envcommon.locals.base_source_url}"
}

inputs = {
  resource_group = {
    name     = local.aks_resource_group
    location = local.location
    exists   = false
  }
  cluster_name                         = local.cluster_name
  prefix                               = local.cluster_name
  cluster_log_analytics_workspace_name = local.cluster_log_analytics_workspace_name
  node_resource_group                  = local.node_resource_group

  vnet_subnet_id = local.vnet_subnet_id

  private_dns_zone_id = "/subscriptions/ade8c3f8-0bb8-4fbd-8bcd-807e8ba2e696/resourceGroups/rg-global-privatednszones/providers/Microsoft.Network/privateDnsZones/privatelink.westeurope.azmk8s.io"
  identity_type       = "UserAssigned"

  attached_acr_id_map = {
    elxacrglnonprod01 = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-GL-ELX-EU-NonProd-01/providers/Microsoft.ContainerRegistry/registries/elxacrglnonprod01"
  }

  node_pools = {
    "userpool" = {
      name                  = "userpool"
      node_count            = 1
      vm_size               = "Standard_DS2_v2"
      vnet_subnet_id        = local.vnet_subnet_id
      os_disk_size_gb       = 128
      enable_auto_scaling   = true
      enable_node_public_ip = false
      min_count             = 1
      max_count             = 2
      max_pods              = 250
      create_before_destroy = true
      zones                 = ["1", "2", "3"]
      node_taints           = []
      node_labels = {
        "mode" = "user"
      }
    }
  }

  service_mesh_profile = {
    mode                             = "Istio"
    internal_ingress_gateway_enabled = true
    external_ingress_gateway_enabled = false
    certificate_authority {
      key_vault_id = "/subscriptions/4731e47d-991b-4fbd-86aa-1e861607b82f/resourceGroups/RG-ELX-GL-Concent-KeyVaults/providers/Microsoft.KeyVault/vaults/elxkv-cert-nonprod-test"
      root_cert_object_name = "ElectroluxRootCA2"
      cert_chain_object_name = "certificate-chain"
      cert_object_name = "interm-cert"
      key_object_name = "certificate-key"
    }
  }

  fluxcd_git_repository_creds = {
    keyvault_name       = "atlantis-elx-nonprod-kv"
    keyvault_rg_name    = "RG-ELX-ATLANTIS-NONPROD-WEU"
    username_secret_key = "azureDevOpsUser"
    token_secret_key    = "azureDevOpsToken"
  }

}

# ---------------------------------------------------------------------------------------------------------------------
# We don't need to override any of the common parameters for this environment, so we don't specify any other parameters.
# ---------------------------------------------------------------------------------------------------------------------
