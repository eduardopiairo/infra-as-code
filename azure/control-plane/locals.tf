locals {
    # Resource Group
    location        = "West Europe"
    resource_group  = "rg-aks-control-plane00"
    env             = "development"
    context         = "controlplane"
    vmsslocation   = lower(replace(local.location, "/\\s+/", ""))


    # Tags
    tags = merge(
        {
        Environment     = local.env
        CreationOrigin  = "terraform"
        Project         = "controlplane"     
        }
    )

    ########################################
    ###             Modulo -  AKS        ###
    ########################################
    kubernetes_version     = "1.30.6"
    aks_name               = "aks-${local.context}-${local.env}-01"
    node_resource_group    = "MC_${local.resource_group}_${local.aks_name}_${local.vmsslocation}"
    vm_size                = "Standard_D2ds_v5"
    subnet_id              = "/subscriptions/5ad4aba7-f6b9-40cb-987d-5efbd3ba320d/resourceGroups/rg-aks-test/providers/Microsoft.Network/virtualNetworks/aks-vnet/subnets/aks-subnet"

}