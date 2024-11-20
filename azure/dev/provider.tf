terraform {
  required_version = "~> 1.9"
  required_providers {

    random = {
      source  = "hashicorp/random"
      version = "= 3.5.1"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.54.0"
    }
    
  }
}

provider "azurerm" {
  features {}
}