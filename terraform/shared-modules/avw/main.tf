resource "azurerm_virtual_wan" "avw" {
  for_each             = var.locations
  name                 = "avw-${each.value.name}"
  resource_group_name  = "${var.resource_group_prefix}-${each.value.name}"
  location             = each.value.name
}
