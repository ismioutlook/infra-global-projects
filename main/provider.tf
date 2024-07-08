terraform {

  required_version = ">=1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.106.1"
    }
  }
  backend "azurerm" {
    key = "infra-global-projects-v1/main/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id            = var.subscription.subscription.subscription_id
  tenant_id                  = var.subscription.subscription.tenant_id
  skip_provider_registration = "true"
}