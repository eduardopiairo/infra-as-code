locals {
    # Resource Group
    location        = "West Europe"
    resource_group  = "rg-aks-control-plane00"
    env             = "development"


    # Tags
    tags = merge(
        {
        Environment     = local.env
        CreationOrigin  = "terraform"
        Project         = "idp"     
        }
    )

}