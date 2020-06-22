resource "azurerm_express_route_gateway" "aeg" {
  for_each             = var.locations
  name                 = "aeg-${each.value.name}"
  resource_group_name  = "${var.resource_group_prefix}-${each.value.name}"
  location             = each.value.name
  virtual_hub_id       = each.value.avh_id
  scale_units          = 1

  tags = {
    environment = "Production"
  }
}
