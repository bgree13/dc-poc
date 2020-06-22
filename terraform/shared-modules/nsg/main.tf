resource "azurerm_network_security_group" "nsg" {
  for_each             = var.locations
  name                 = "nsg-${each.value.nsg}-${each.value.env}"
  location             = each.value.nsg
  resource_group_name  = "${var.resource_group_prefix}-${each.value.nsg}"

  security_rule {
    name                       = "inbound_allow_all"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
