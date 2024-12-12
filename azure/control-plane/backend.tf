terraform {
  backend "azurerm" {
    resource_group_name  = "rg-platform-idp"
    storage_account_name = "storageplatformidp"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}