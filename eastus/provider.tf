terraform {

  required_version = ">=1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.101.0"
    }
  }
  backend "azurerm" {
    key = "infra-global-projects-v1/eastus/terraform.tfstate"
  }
}

# provider "kubernetes" {
#   config_path = local_file.kubeconfig.filename
# }

provider "azurerm" {
  features {}
  subscription_id            = var.subscription.subscription.subscription_id
  tenant_id                  = var.subscription.subscription.tenant_id
  skip_provider_registration = "true"
}