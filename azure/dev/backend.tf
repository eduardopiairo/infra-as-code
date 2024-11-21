terraform {
  backend "azurerm" {
    resource_group_name  = "rg-devopsquest"
    storage_account_name = "storagedevopsquest"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}