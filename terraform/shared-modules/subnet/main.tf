resource "azurerm_subnet" "sub" {
  for_each             = var.locations
  name                 = "subnet-${each.value.vnet}-${each.value.env}"
  resource_group_name  = "${var.resource_group_prefix}-${each.value.vnet}"
  virtual_network_name = "vnet-${each.value.vnet}"
  address_prefix       = each.value.addr_pfx
}
