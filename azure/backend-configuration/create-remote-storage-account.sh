#!/bin/bash

# Please do az login --tenant xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

RESOURCE_GROUP_NAME=rg-devopsquest

# Storage account name must be between 3 and 24 characters in length and use numbers and lower-case letters only.
STORAGE_ACCOUNT_NAME=storagedevopsquest
STORAGE_SKU=Standard_LRS
CONTAINER_NAME=tfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location westeurope

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku $STORAGE_SKU --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME