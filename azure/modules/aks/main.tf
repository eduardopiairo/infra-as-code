#resource "azurerm_user_assigned_identity" "aks_identity" {
#  location                        = var.location
#  resource_group_name             = var.resource_group_name
#  name                            = "identity-${var.cluster_name}"
#}

resource "azurerm_kubernetes_cluster" "k8s" {

  name                            = var.cluster_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  node_resource_group             = var.node_resource_group
  dns_prefix                      = var.cluster_name
  kubernetes_version              = var.kubernetes_version
  private_cluster_enabled         = var.private_cluster_enabled

  azure_policy_enabled           = var.azure_policy_enabled


  # RBAC, Azure AAD & Azure RBAC.
  # local_account_disabled            = var.local_account_disabled
  role_based_access_control_enabled = var.role_based_access_control_enabled

  # azure_active_directory_role_based_access_control {
  #   managed                = true
  #   azure_rbac_enabled     = false
  #   admin_group_object_ids = var.admin_group_object_ids
  # }

  # auto_scaler_profile {
  #   balance_similar_node_groups      = var.balance_similar_node_groups
  #   max_graceful_termination_sec     = var.max_graceful_termination_sec
  #   scale_down_utilization_threshold = var.scale_down_utilization_threshold
  #   skip_nodes_with_local_storage    = var.skip_nodes_with_local_storage # Nodes should use local storage only as cache or temporary not as persistent storage
  #   skip_nodes_with_system_pods      = var.skip_nodes_with_system_pods
  # }

  default_node_pool {
    name                 = var.name_pool
    orchestrator_version = var.orchestrator_version
    zones                = var.zones
    max_pods             = var.max_pods
    min_count            = var.min_count
    max_count            = var.max_count
    node_count           = var.node_count
    os_disk_size_gb      = var.os_disk_size_gb
    os_disk_type         = var.os_disk_type
    vm_size              = var.vm_size
    vnet_subnet_id       = var.snet_aks_id
    tags                 = var.tags
    #enable_auto_scaling  = var.enable_auto_scaling
  }

  identity {
     type =  "SystemAssigned"
  #   identity_ids  = [azurerm_user_assigned_identity.aks_identity.id]
  }

  network_profile {
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
    network_plugin     = "kubenet"
    network_policy     = null

    nat_gateway_profile {
      idle_timeout_in_minutes = 4
    }
  }
  lifecycle {
    ignore_changes = [default_node_pool[0].node_count,]
       }
  tags = var.tags
}