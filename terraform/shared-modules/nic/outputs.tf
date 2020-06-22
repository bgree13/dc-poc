output "nic_id" {
  value = {
    for nic in azurerm_network_interface.nic:
    nic.name => nic.id
  }
}
