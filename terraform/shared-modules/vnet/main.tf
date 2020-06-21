resource "azurerm_virtual_network" "avn" {
  for_each             = var.locations
  name                 = "vnet-${each.value.name}"
  resource_group_name  = "${var.resource_group_prefix}-${each.value.name}"
  address_space        = [each.value.cidr[0]]
  location             = each.value.name
}
