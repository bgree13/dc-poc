output "avw_id" {
  value = {
    for avw in azurerm_virtual_wan.avw:
    avw.name => avw.id
  }
}
