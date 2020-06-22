output "avh_id" {
  value = {
    for avh in azurerm_virtual_hub.avh:
    avh.name => avh.id
  }
}
