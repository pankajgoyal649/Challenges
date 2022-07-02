resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = var.resource_group_name
  address_space = var.vnet_address_space
  location = var.location
  tags = {
    env= var.tag
  }
  
}

resource "azurerm_subnet" "subnets" {
  for_each = var.vnet_subnets_cidr_blocks
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
  name = each.value["name"]
  address_prefixes=each.value["address_prefixes"]
  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_network_security_group" "web-subnet-nsg" {
  location = var.location
  name = "web-subnet-nsg"
  resource_group_name = var.resource_group_name

  security_rule {
    access = "Allow"
    direction = "Inbound"
    name = "http"
    priority = "100"
    protocol = "Tcp"
    source_address_prefix = "*"
    source_port_range =  "*"
    destination_port_range = "80"
    destination_address_prefix  = "*"

  }

  tags = {
    env = var.tag
  }
}

resource "azurerm_subnet_network_security_group_association" "attachnsgtowebsubnet" {
  network_security_group_id = azurerm_network_security_group.web-subnet-nsg.id
  subnet_id = var.subnet_id["web-subnet"]
  depends_on = [azurerm_network_security_group.web-subnet-nsg, azurerm_subnet.subnets]
}