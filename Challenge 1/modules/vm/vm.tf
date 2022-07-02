resource "azurerm_public_ip" "public-ip" {
  name                    = "web-instance-public-ip"
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Static"
  idle_timeout_in_minutes = 30
  sku = "Standard"

  tags = {
    environment = var.tag
  }
}

resource "azurerm_network_interface" "web-instance-nic" {
  name                = "web-instance-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "web-instance-ip-config"
    subnet_id                     = var.subnet_id["web-subnet"]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip.id

  }

  depends_on = [azurerm_public_ip.public-ip]

}

resource "azurerm_network_interface" "backend-instance-nic" {
  name                = "backend-instance-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "backend-instance-ip-config"
    subnet_id                     = var.subnet_id["backend-subnet"]
    private_ip_address_allocation = "Dynamic"

  }


}

resource "azurerm_network_interface" "db-instance-nic" {
  name                = "db-instance-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "db-instance-ip-config"
    subnet_id                     = var.subnet_id["db-subnet"]
    private_ip_address_allocation = "Dynamic"

  }


}

resource "azurerm_linux_virtual_machine" "web-instance" {
  name                = "web-instance"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm1_size
  admin_username      = var.vm1_admin_username
  admin_password      = var.vm1_admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.web-instance-nic.id,
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  depends_on = [azurerm_network_interface.web-instance-nic]

}

resource "azurerm_linux_virtual_machine" "backend-instance" {
  name                = "backend-instance"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm1_size
  admin_username      = var.vm1_admin_username
  admin_password      = var.vm1_admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.backend-instance-nic.id,
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  depends_on = [azurerm_network_interface.backend-instance-nic]

}

resource "azurerm_linux_virtual_machine" "db-instance" {
  name                = "db-instance"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm1_size
  admin_username      = var.vm1_admin_username
  admin_password      = var.vm1_admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.db-instance-nic.id,
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  depends_on = [azurerm_network_interface.db-instance-nic]

}