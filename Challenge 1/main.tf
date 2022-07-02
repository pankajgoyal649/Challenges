module "resourceGroup" {
  source = "./modules/resourceGroup/"
  location = var.location
  resource_group_name = var.resource_group_name
  tag = var.tag
}

module "network" {
  source = "./modules/network/"

  location = var.location
  resource_group_name = var.resource_group_name
  tag = var.tag
  vnet_name = var.vnet_name
  vnet_address_space=var.vnet_address_space
  vnet_subnets_cidr_blocks = var.vnet_subnets_cidr_blocks
  subnet_id = module.network.subnet_id
}

module "vm" {
  source = "./modules/vm/"
   location = var.location
  resource_group_name = var.resource_group_name
  tag = var.tag
  subnet_id = module.network.subnet_id
  vm1_name = var.vm1_name
  vm1_admin_username = var.vm1_admin_username
  vm1_admin_password = var.vm1_admin_password
  vm1_size = var.vm1_size
}