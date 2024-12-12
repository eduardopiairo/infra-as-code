locals {
    # Resource Group
    location        = "West Europe"
    resource_group  = "rg-aks-control-plane00"
    env             = "sandbox"


    # Tags
    tags = merge(
        {
        Environment     = local.env
        CreationOrigin  = "terraform"
        Project         = "idp-control-plane"     
        }
    )

}