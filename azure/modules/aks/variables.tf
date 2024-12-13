variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "node_resource_group" {
  type        = string
  description = "The node resource group name"
}

variable "location" {
  type        = string
  description = "Location of cluster, if not defined it will be read from the resource-group"
  default     = null
}

variable "cluster_name" {
  type        = string
  description = "(Optional) The name for the AKS resources created in the specified Azure Resource Group. This variable overwrites the 'prefix' var (The 'prefix' var will still be applied to the dns_prefix if it is set)"
  default     = null
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to deploy"
  type        = string
  default     = null
}

variable "private_cluster_enabled" {
  type        = bool
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet."
  default     = false
}

variable "azure_policy_enabled" {
  type        = bool
  description = "Enable Azure Policy Addon."
  default     = false
}

variable "local_account_disabled" {
  type        = bool
  description = "(Optional) - If `true` local accounts will be disabled. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#disable-local-accounts) for more information."
  default     = null
}

variable "role_based_access_control_enabled" {
  type        = bool
  description = "Enable Role Based Access Control."
  default     = false
}

variable "snet_aks_id" {
  type        = string
  description = "(Optional) The ID of the Subnet where the pods in the default Node Pool should exist. Changing this forces a new resource to be created."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the AKS cluster resources"
  default     = {}
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Enable node pool autoscaling"
}

variable "zones" {
  type        = list(string)
  description = "(Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created."
  default     = null
}

variable "name_pool" {}

variable "max_pods" {
  type        = number
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  default     = null
}

variable "min_count" {
  type        = number
  description = "Minimum number of nodes in a pool"
  default     = null
}

variable "max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"
  default     = null
}

variable "os_disk_size_gb" {
  type        = number
  description = "Disk size of nodes in GBs."
  default     = 128
}
variable "os_disk_type" {
  type        = string
  description = "The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. Changing this forces a new resource to be created."
  default     = "Managed"
  nullable    = false
}
variable "node_count" {}
variable "vm_size" {}
variable "admin_group_object_ids" {}
variable "balance_similar_node_groups" {}
variable "max_graceful_termination_sec" {}
variable "scale_down_utilization_threshold" {}
variable "skip_nodes_with_local_storage" {}
variable "skip_nodes_with_system_pods" {}
variable "orchestrator_version" {}