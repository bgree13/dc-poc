output "resource_group_names" {
  value = [
    for rsg in azurerm_resource_group.rsg:
    rsg.name
  ]
}
output "resource_group_ids" {
  value = [
    for rsg in azurerm_resource_group.rsg:
    rsg.id
  ]
}
