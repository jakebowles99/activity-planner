resource "azurerm_resource_group" "dev" {
  name     = "dev"
  location = "uksouth"
}

resource "azurerm_virtual_network" "dev" {
  name                = "dev"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
}

resource "azurerm_subnet" "dev" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.dev.name
  virtual_network_name = azurerm_virtual_network.dev.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "dev" {
  name                = "dev"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.dev.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.dev.id
  }
}

resource "azurerm_public_ip" "dev" {
  name                = "dev"
  resource_group_name = azurerm_resource_group.dev.name
  location            = azurerm_resource_group.dev.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "dev" {
  name                = "ssh"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "tls"
    priority                   = 300
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "22"
    destination_address_prefix = azurerm_network_interface.dev.private_ip_address
  }
}

resource "azurerm_network_interface_security_group_association" "dev" {
  network_interface_id      = azurerm_network_interface.dev.id
  network_security_group_id = azurerm_network_security_group.dev.id
}

data "local_file" "cloudinit" {
  filename = "./cloudinit.conf"
}

resource "azurerm_linux_virtual_machine" "dev" {
  name                = "dev"
  resource_group_name = azurerm_resource_group.dev.name
  location            = azurerm_resource_group.dev.location
  size                = "Standard_d4s_v3"
  admin_username      = "adminuser"
  custom_data = base64encode(data.local_file.cloudinit.content)
  network_interface_ids = [
    azurerm_network_interface.dev.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_azuredev.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "20.04.202210180"
  }
}