#-----------------------------resource group module variables-----------------------------------------

variable "resource_group_name_eu" {
  type        = string
  description = "Name of the resource group in the EU region."
}

variable "resource_group_location_eu" {
  type        = string
  description = "Location of the resource group in the EU region."
}

variable "resource_group_location_us" {
  type        = string
  description = "Location of the resource group in the US region."
}

variable "resource_group_name_us" {
  type        = string
  description = "Name of the resource group in the US region."
}

variable "resource_group_location_au" {
  type        = string
  description = "Location of the resource group in the Australia region."
}

variable "resource_group_name_au" {
  type        = string
  description = "Name of the resource group in the Australia region."
}

#-----------------------------Virtual Network module variables-----------------------------------------
variable "virtual_network_name_eu" {
  type        = string
  description = "Name of the virtual network in the EU region."
}

variable "virtual_network_name_us" {
  type        = string
  description = "Name of the virtual network in the US region."
}

variable "virtual_network_name_au" {
  type        = string
  description = "Name of the virtual network in the Australia region."
}

variable "vnet_address_space_eu" {
  type        = list(string)
  description = "Address space of the virtual network in the EU region."
}

variable "vnet_address_space_us" {
  type        = list(string)
  description = "Address space of the virtual network in the US region."
}

variable "vnet_address_space_au" {
  type        = list(string)
  description = "Address space of the virtual network in the Australia region."
}

variable "subnet_name" {
  type        = list(string)
  description = "Name of the subnet."
}

variable "subnet_address_space_eu" {
  type        = list(string)
  description = "Address space of the subnet in the EU region."
}

variable "subnet_address_space_us" {
  type        = list(string)
  description = "Address space of the subnet in the US region."
}

variable "subnet_address_space_au" {
  type        = list(string)
  description = "Address space of the subnet in the Australia region."
}

variable "service_endpoints" {
  type        = list(string)
  description = "List of service endpoints."
}


#--------------------------------------Traffic Manager--------------------------------------------------


variable "traffic_manager_name" {
  type        = string
  description = "Name of the Traffic Manager."
}

variable "traffic_routing_method" {
  type        = string
  description = "Traffic routing method for the Traffic Manager."
}

variable "ttl_value" {
  type        = number
  description = "TTL value for DNS records."
}

variable "protocol" {
  type        = string
  description = "Protocol for health checks."
}

variable "port" {
  type        = number
  description = "Port number for health checks."
}

variable "path" {
  type        = string
  description = "Path for health checks."
}

variable "interval_in_seconds" {
  type        = number
  description = "Interval between health checks in seconds."
}

variable "timeout_in_seconds" {
  type        = number
  description = "Timeout for health checks in seconds."
}

variable "tolerated_number_of_failures" {
  type        = number
  description = "Number of tolerated failures for health checks."
}

# Azure Subscription 
variable "tenant_id" {
  type        = string
  description = "Tenant id"
  default     = "d2007bef-127d-4591-97ac-10d72fe28031"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = "f28071b5-e402-4c1a-83cc-ed0744ce8e0a"
}

#------------------------------------------AKS Cluster EU------------------------------------#

# LogAnalytics workspace & Solution details

variable "log_analytics_name" {
  type        = string
  description = "The Name of the log analytics workspace "
}

variable "la_sku" {
  type        = string
  description = "log analytics workspace sku or pricing tier"
  #default     = "PerGB2018"
}

variable "la_solution_name" {
  type        = string
  description = "log analytics solution name"
  #default     = "ContainerInsights"
}

# Kubernetes cluster

variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}


variable "kubernetes_version" {
  type        = string
  description = "The AKS Kubernetes version"
}


variable "pod_security_policy" {
  type        = bool
  description = "Enable PodSecurityPolicy the Kubernetes API"
}



# Default node pool

variable "node_count" {
  type        = number
  description = "The default node pool instance count"
}

variable "node_vm_size" {
  type        = string
  description = "The Azure VM instance type"
  # default     = "Standard_D2s_v3"
}

variable "os_disk_size_gb" {
  default     = 80
  type        = number
  description = "Default node pool disk size"
}

variable "subnet_id" {
  type        = string
  description = "vnet subnet id"
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Enable autoscaling on the default node pool"
}

variable "node_min_count" {
  default     = 1
  type        = number
  description = "Default node pool intial count (used with autoscaling)"
}

variable "node_max_count" {
  default     = 5
  type        = number
  description = "Default node pool max count (use with autoscaling)"
}

variable "node_max_pods" {
  default     = 60
  type        = number
  description = "Total amount of pods allowed per node"
}

variable "node_taints" {
  type        = list(string)
  description = "Taints for default pool nodes"
}

variable "node_labels" {
  description = "A map of Kubernetes labels which should be applied to nodes in the Default Node Pool"
  type        = map(any)
  default = {
    "service" = "kubernetes"
  }
}

# Addons node pool

variable "node_pools" {
  description = "Addons node pools"
  type = list(object({
    name                = string
    vm_size             = string
    os_disk_size_gb     = number
    enable_auto_scaling = bool
    node_count          = number
    min_count           = number
    max_count           = number
    max_pods            = number
    node_taints         = list(string)
    node_labels         = map(string)
  }))
  default = []
}

# Network profile

variable "network_plugin" {
  type        = string
  description = "The CNI network plugin to use (only azure, or kubenet)"
}

variable "network_policy" {
  type        = string
  description = "The network polcy for the CNI. Only used when network_plugin is set to azure. Supported values: calico, azure"
}

variable "pod_cidr" {
  type        = string
  description = "The CIDR for the pod network"
}

variable "service_cidr" {
  type        = string
  description = "The CIDR for kubernetes services"
}

variable "dns_service_ip" {
  type        = string
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery"
}

variable "docker_bridge_cidr" {
  type        = string
  description = " IP address (in CIDR notation) used as the Docker bridge IP address on nodes"
}


# Auto-scaler profile

variable "balance_similar_node_groups" {
  description = "Detect similar node groups and balance the number of nodes between them"
  type        = bool
  default     = false
}

variable "max_graceful_termination_sec" {
  description = "Maximum number of seconds the cluster autoscaler waits for pod termination when trying to scale down a node"
  type        = string
  default     = "600"
}

variable "scan_interval" {
  description = "How often the AKS Cluster should be re-evaluated for scale up/down"
  type        = string
  default     = "10s"
}


variable "scale_down_delay_after_add" {
  description = "How long after the scale up of AKS nodes the scale down evaluation resumes"
  type        = string
  default     = "10m"
}

variable "scale_down_delay_after_delete" {
  type        = string
  description = "How long after node deletion that scale down evaluation resumes"
  default     = "10s"
}

variable "scale_down_delay_after_failure" {
  description = "How long after scale down failure that scale down evaluation resumes"
  type        = string
  default     = "10m"
}

variable "scale_down_unneeded" {
  description = "How long a node should be unneeded before it is eligible for scale down"
  type        = string
  default     = "10m"
}

variable "scale_down_unready" {
  description = "How long an unready node should be unneeded before it is eligible for scale down"
  type        = string
  default     = "10m"
}

variable "scale_down_utilization_threshold" {
  description = "Node utilization level, defined as sum of requested resources divided by capacity, below which a node can be considered for scale down"
  type        = string
  default     = "0.5"
}

#-----------------------------------------------------Tags--------------------------------------------------------
variable "owner_tag" {
  type = string
  #default     = "Arun Nalliannan"
  description = "Owner of the resource"
}

variable "account_tag" {
  type = string
  #default     = "623065"
  description = "Account"
}

variable "billingid_tag" {
  type = string
  #default     = "MyAccounts"
  description = "Billing ID"
}

variable "costcenterit_tag" {
  type = string
  #default     = "10350645"
  description = "Cost Center"
}

variable "sector_tag" {
  type = string
  #default     = "BAEurope"
  description = "Sector"
}

variable "env_tag" {
  type = string
  #default     = "DEV"
  description = "Environment used in the tags of the resources"
}

variable "created_by_tag" {
  type = string
  #default     = "PETeam"
  description = "mention created by tag"
}