resource "azurerm_network_interface" "nic" {
  for_each             = var.locations
  name                 = "nic-${each.value.nic}-${each.value.env}"
  location             = each.value.nic
  resource_group_name  = "${var.resource_group_prefix}-${each.value.nic}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
