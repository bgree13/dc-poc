output "subnet_id" {
  value = {
    for subnet in azurerm_subnet.sub:
    subnet.name => subnet.id
  }
}
