# Infrastructure as Code
Infrastructure as Code

## Terraform

Terraform automates infrastructure provision and manages resources in any cloud. The infrastructure is defined through Terraform code.

### Requirements

- Install Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli



### Azure

#### Requirements

- Install Azure CLI: : https://docs.microsoft.com/en-us/cli/azure/install-azure-cli


#### Backend Configuration - Azure Storage Account

- The Terraform state will be stored in a storage account. 


Login to the Azure subscription
```
az login --tenant "<subscription-tenant>"
```

You can check the active subscription with the command:
```
az account show --output table
```

And then, if needed, change the active subscription with:
``` 
az account set --subscription "<subscription-id>"
```


