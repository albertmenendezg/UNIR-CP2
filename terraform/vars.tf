variable "resource_group_name" {
  type        = string
  default     = "UNIR-CP2-AMG-rg"
  description = "Name of all resources group"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Global localization to deploy the infrastructure"
}

variable "vm_virtual_network_name" {
  type    = string
  default = "UNIR-CP2-AMG-network"
}

variable "vm_subnet_name" {
  type    = string
  default = "UNIR-CP2-AMG-subnet"
}

variable "vm_name" {
  type = string

  default = "UNIR-CP2-AMG-vm"
}

variable "vm_admin_username" {
  type    = string
  default = "AMG"
}

variable "acr_name" {
  type    = string
  default = "unircp2amgacr"
}

variable "aks_cluster_name" {
  type = string
  default = "unircp2amg"
}
