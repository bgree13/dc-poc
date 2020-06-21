output "resource_groups" {
  description = "List all newly created resource groups"
  value = module.rsg-cs1.resource_group_names
}
output "resource_group_ids" {
  description = "List all newly created resource group ids"
  value = module.rsg-cs1.resource_group_ids
}
