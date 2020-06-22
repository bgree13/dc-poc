resource "azurerm_virtual_hub" "avh" {
  for_each             = var.locations
  name                 = "avh-${each.value.name}"
  resource_group_name  = "${var.resource_group_prefix}-${each.value.name}"
  location             = each.value.name
  virtual_wan_id       = each.value.avw_id
  address_prefix       = each.value.addr_pfx
}
