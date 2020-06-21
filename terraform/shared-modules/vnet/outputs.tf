/*
locals {
  regionslist = ["eastus", "westus"]
}

output "vnet_names" {
  value = [
    for rl in local.regionslist: [
      for avn in azurerm_virtual_network.avn: [
        join("-",[rl,avn])
      ]
    ]
  ]
}
*/
/*
locals {
  regionslist = ["eastus", "westus"]

  value = [
    for rl in local.regionslist: [
      for avn in azurerm_virtual_network.avn: [
        rl,avn
      ]
    ]
  ]
}

output vnet_names {
  value = flatten(local.value)
}
*/
