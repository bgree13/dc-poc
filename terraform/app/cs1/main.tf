locals {

  # resource group prefix
  rsg_pfx         = "my-test-bgree13"

  # regions
  loc_eastus      = "eastus"
  loc_westus      = "westus"

}
module "rsg-cs1" {
  source          = "../../shared-modules/rsg"
  resource_group  = local.rsg_pfx
  locations       = [local.loc_eastus,local.loc_westus]
}
