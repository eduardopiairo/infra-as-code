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
  source              = "../../../modules/azure/aks/"
  resource_group_name = local.resource_group
  node_resource_group = local.node_resource_group
  location            = local.location
  cluster_name        = local.aks_name
  kubernetes_version  = local.kubernetes_version

  ##################
  #### Security ####
  ##################
  private_cluster_enabled           = false
  local_account_disabled            = false
  azure_policy_enabled              = true
  role_based_access_control_enabled = true

  ### Infra Group ###
  admin_group_object_ids = ["bebdad99-cc43-4329-9143-6c49fd614463"] # old Tenant!

  ##################
  #### Network  ####
  ##################
  snet_aks_id = local.subnet_id

  ###########################
  ### auto_scaler_profile ###
  ###########################
  balance_similar_node_groups      = true
  max_graceful_termination_sec     = "600"
  scale_down_utilization_threshold = "0.7"
  skip_nodes_with_local_storage    = true # Nodes should use local storage only as cache or temporary not as persistent storage
  skip_nodes_with_system_pods      = true

  ######################
  #### Default Node ####
  ######################
  name_pool            = "default"
  orchestrator_version = local.kubernetes_version
  enable_auto_scaling  = true
  zones                = ["1", "2"]
  max_pods             = 150
  min_count            = 3
  max_count            = 4
  node_count           = 3
  os_disk_size_gb      = "128"
  os_disk_type         = "Ephemeral"
  vm_size              = local.vm_size

  tags     = local.tags
}