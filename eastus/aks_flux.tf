# resource "azurerm_kubernetes_cluster_extension" "flux" {
#   name           = "flux"
#   cluster_id     = module.us_gl_aks.aks_id
#   extension_type = "microsoft.flux"
# }

# resource "azurerm_kubernetes_flux_configuration" "k8s_flux" {
#   name       = "flux-system"
#   cluster_id = module.us_gl_aks.aks_id
#   namespace  = "flux-system"

#   git_repository {
#     url             = "https://ELX-Marketing-DevOps@dev.azure.com/ELX-Marketing-DevOps/platform-engineering-stack/_git/aks-clusters-conf"
#     reference_type  = "branch"
#     reference_value = "main"
#     https_user = data.azurerm_key_vault_secret.ado_user.value
#     https_key_base64 = base64encode(data.azurerm_key_vault_secret.ado_token.value)
#   }

#   kustomizations {
#     name                      = "cluster"
#     path                      = "./clusters/${terraform.workspace}/eastus"
#     sync_interval_in_seconds  = 120
#     retry_interval_in_seconds = 120
#   }

#   scope = "cluster"

#   depends_on = [
#     azurerm_kubernetes_cluster_extension.flux
#   ]
# }