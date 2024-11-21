locals {
    # Resource Group
    location        = "West Europe"
    resource_group  = "rg-aks-platform-test"
    env             = "sandbox"


    # Tags
    tags = merge(
        {
        Environment     = local.env
        CreationOrigin  = "terraform"
        Project         = "internal-platform"     
        }
    )

}