terraform {

  required_version = ">=1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.57.0"
    }
  }
  backend "azurerm" {
    key = "infra-global-projects-v1/fsm-cosmosdb/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}