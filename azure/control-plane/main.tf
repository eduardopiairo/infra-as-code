#######################################
##      Module -  ResourceGroup     ###
#######################################
module "resource_group" {
  source   = "../modules/resource_group"
  name     = local.resource_group
  location = local.location
  tags     = local.tags
}


########################################
###          Module - AKS            ###
########################################
module "aks" {
  source              = "../modules/aks/"
  resource_group_name = local.resource_group
  node_resource_group = local.node_resource_group
  location            = local.location
  cluster_name        = local.aks_name
  kubernetes_version  = local.kubernetes_version
