output "subnet_id" {
    value = {
        for id in keys(var.vnet_subnets_cidr_blocks) : id => azurerm_subnet.subnets[id].id
    }
    description = "Lists the ids of the subnet"
  
}