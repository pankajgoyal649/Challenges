variable "location" {
  type        = string
  description = "Location of all the resources"
}

variable "resource_group_name" {
  description = "Name of Resource Group"
}

variable "tag" {}

#################################
#Virtual Network
variable "vnet_name" {
  type        = string
  description = "Vnet Name"
}


variable "vnet_address_space" {
  description = "Base CIDR Block for VNET"
}

###############################
#Subnet

variable "vnet_subnets_cidr_blocks" {
  type        = map(any)
  description = "CIDR Blocks for Subnets in VNET"
}

#NSG
variable "subnet_id" {
  
}