locals {

  # resource group prefix
  rsg_pfx         = "my-test-bgree13"

  # regions
  loc_eastus      = "eastus"
  loc_westus      = "westus"

  # cidr adress
  cidr_addr_1     = "10.0.0.0/16"

  # dev
  var_env_dev     = "dev"
  addr_pfx_dev_1  = "10.0.1.0/24"

  # qa
  var_env_qa      = "qa"
  addr_pfx_qa_1   = "10.0.2.0/24"

  # prod
  var_env_prod    = "prod"
  addr_pfx_prod_1 = "10.0.3.0/24"
}

module "vnet-cloud" {
  source                 = "../../shared-modules/vnet"
  resource_group_prefix  = local.rsg_pfx
  locations = {
      eastus = {
          name   = local.loc_eastus
          cidr   = [local.cidr_addr_1]
      },
      westus = {
          name   = local.loc_westus
          cidr   = [local.cidr_addr_1]
      }
  }
}

module "subnet-dev" {
  source                 = "../../shared-modules/subnet"
  resource_group_prefix  = local.rsg_pfx
  locations = {
      eastus = {
          vnet       = local.loc_eastus
          env        = local.var_env_dev
          addr_pfx   = local.addr_pfx_dev_1
      },
      westus = {
          vnet       = local.loc_westus
          env        = local.var_env_dev
          addr_pfx   = local.addr_pfx_dev_1
      }
  }
}

module "subnet-qa" {
    source                 = "../../shared-modules/subnet"
    resource_group_prefix  = local.rsg_pfx
    locations = {
        eastus = {
            vnet       = local.loc_eastus
            env        = local.var_env_qa
            addr_pfx   = local.addr_pfx_qa_1
        },
        westus = {
            vnet       = local.loc_westus
            env        = local.var_env_qa
            addr_pfx   = local.addr_pfx_qa_1
        }
    }
}

module "subnet-prod" {
    source                 = "../../shared-modules/subnet"
    resource_group_prefix  = local.rsg_pfx
    locations = {
        eastus = {
            vnet       = local.loc_eastus
            env        = local.var_env_prod
            addr_pfx   = local.addr_pfx_prod_1
        },
        westus = {
            vnet       = local.loc_westus
            env        = local.var_env_prod
            addr_pfx   = local.addr_pfx_prod_1
        }
    }
}

module "nic-jump-01" {
    source                 = "../../shared-modules/nic"
    resource_group_prefix  = local.rsg_pfx
    locations = {
        eastus = {
            nic        = local.loc_eastus
            env        = local.var_env_dev
            subnet_id  = "${module.subnet-dev.subnet_id["subnet-eastus-dev"]}"
        },
        westus = {
            nic       = local.loc_westus
            env        = local.var_env_dev
            subnet_id  = "${module.subnet-dev.subnet_id["subnet-westus-dev"]}"
        }
    }
}
