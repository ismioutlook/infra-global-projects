terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.94.0"
    }
  }
  backend "azurerm" {
    key = "concent-claims/terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "rg" {
  count    = var.enabled ? 1 : 0
  name     = "atlantis-controlled-product-${terraform.workspace}-rg"
  location = "westeurope"
  tags = {
    environment = "${terraform.workspace}"
    purpose     = "atlantis-poc-via-sandbox"
  }
}