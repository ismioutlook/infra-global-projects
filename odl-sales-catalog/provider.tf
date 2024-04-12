terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.94.0"
    }
  }
  backend "azurerm" {
    key = "odl-sales-catalog/terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}