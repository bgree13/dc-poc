resource "azurerm_resource_group" "rsg" {
  for_each = toset(var.locations)
  name     = "${var.resource_group}-${each.value}"
  location = each.value
}
