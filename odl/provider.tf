terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.104.2"
    }
  }
  backend "azurerm" {
    key = "odl-core/terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}