resource "azurerm_linux_virtual_machine" "lvm" {
  for_each             = var.locations
  name                = "lvm-${each.value.lvm}-${each.value.env}"
  resource_group_name  = "${var.resource_group_prefix}-${each.value.lvm}"
  location             = each.value.lvm
  size                = each.value.size
  admin_username      = "adminuser"
  network_interface_ids = [
    each.value.nic_id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
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
}
