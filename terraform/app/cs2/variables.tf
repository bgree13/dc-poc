locals {

  # resource group prefix
  rsg_pfx         = "my-test-bgree13"

  # regions
  loc_eastus      = "eastus"
  loc_westus      = "westus"

  # cidr address
  cidr_addr_1     = "10.0.0.0/16"

  # vwan
  addr_pfx_vwan_1 = "10.0.1.0/24"

  # admin
  var_env_admin         = "admin"
  subnet_eastus_admin_1 = "subnet-eastus-admin"
  subnet_westus_admin_1 = "subnet-westus-admin"
  addr_pfx_admin_1      = "10.0.2.0/24"

  # dev
  var_env_dev          = "dev"
  subnet_eastus_dev_1  = "subnet-eastus-dev"
  subnet_westus_dev_1  = "subnet-westus-dev"
  addr_pfx_dev_1       = "10.0.3.0/24"

  # qa
  var_env_qa      = "qa"
  addr_pfx_qa_1   = "10.0.4.0/24"

  # prod
  var_env_prod    = "prod"
  addr_pfx_prod_1 = "10.0.5.0/24"

  # vm
  vm_standard_size_eastus = "Standard_F2"
  vm_standard_size_westus = "Standard_D2s_v3"

}
