terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.94.0"
    }
  }
  backend "azurerm" {
    key = "c4c-replica-md/terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}