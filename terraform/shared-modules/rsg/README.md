rsg module
===========

A terraform module to configure an Azure resource group


Module Input Variables
----------------------

- `resource_group` - Name of the app service plan to deploy.
- `location`  - Name of region resources are intended to run

Usage
-----

```hcl
module "rsg-cs1" {
  source         = "../../shared-modules/rsg"
  resource_group = "my-test-bgree13"
  locations       = ["eastus","westus"]
}
```

Outputs
=======

 - `azurerm_app_service_plan.srvp.id`:  The app service plan name being deployed.


License
=======

Apache 2 Licensed. See LICENSE for full details.
