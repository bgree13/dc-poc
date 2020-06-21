module "rsg-cs1" {
  source          = "../../shared-modules/rsg"
  resource_group  = "my-test-bgree13"
  locations       = ["eastus","westus"]
}
