##########################
# COMMON VARAIABLES
##########################

variable "subscription_id" {
  description = "Subscription ID for provisioning resources in Azure"
}

variable "tenant_id" {
  description = "Tenant ID for provisioning resources in Azure"
}

variable "client_id" {
  description = "App ID for provisioning resources in Azure"
}

variable "client_secret" {
  description = "Password for provisioning resources in Azure"
}

variable "location" {
  description = "default location of all the resources"
}

variable "tag" {
}

####################################
# RESOURCE GROUP
#######################################

variable "resource_group_name" {
  description = "Resource Group Name"
}

#################################
#Virtual Network
variable "vnet_name" {}

variable "vnet_address_space" {}

#############################
#Subnet

variable "vnet_subnets_cidr_blocks" {
  description = "CIDR Blocks for Subnets in VNET"
}


######################
#web instance VM
variable "vm1_name" {  
}

variable "vm1_admin_username" {
}
variable "vm1_admin_password" {
  
}

variable "vm1_size" {
  
}