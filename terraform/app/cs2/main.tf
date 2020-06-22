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

module "vwan-cloud" {
  source                 = "../../shared-modules/avw"
  resource_group_prefix  = local.rsg_pfx
  locations = {
      eastus = {
          name   = local.loc_eastus
      },
      westus = {
          name   = local.loc_westus
      }
  }
}

module "vhub-cloud" {
  source                 = "../../shared-modules/avh"
  resource_group_prefix  = local.rsg_pfx
  locations = {
      eastus = {
          name   = local.loc_eastus
          addr_pfx  = local.addr_pfx_vwan_1
          avw_id    = "${module.vwan-cloud.avw_id["avw-eastus"]}"

      },
      westus = {
          name   = local.loc_westus
          addr_pfx   = local.addr_pfx_vwan_1
          avw_id     = "${module.vwan-cloud.avw_id["avw-westus"]}"
      }
  }
}

module "aeg-cloud" {
  source                 = "../../shared-modules/aeg"
  resource_group_prefix  = local.rsg_pfx
  locations = {
      eastus = {
          name      = local.loc_eastus
          avh_id    = "${module.vwan-cloud.avh_id["avh-eastus"]}"
      },
      westus = {
          name   = local.loc_westus
          avh_id    = "${module.vwan-cloud.avh_id["avh-westus"]}"
      }
  }
}

module "subnet-admin" {
  source                 = "../../shared-modules/subnet"
  resource_group_prefix  = local.rsg_pfx
  locations = {
      eastus = {
          vnet       = local.loc_eastus
          env        = local.var_env_admin
          addr_pfx   = local.addr_pfx_admin_1
      },
      westus = {
          vnet       = local.loc_westus
          env        = local.var_env_admin
          addr_pfx   = local.addr_pfx_admin_1
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

module "nic-jump-admin-01" {
    source                 = "../../shared-modules/nic"
    resource_group_prefix  = local.rsg_pfx
    locations = {
        eastus = {
            nic        = local.loc_eastus
            env        = local.var_env_admin
            subnet_id  = "${module.subnet-admin.subnet_id["${local.subnet_eastus_admin_1}"]}"
        },
        westus = {
            nic        = local.loc_westus
            env        = local.var_env_admin
            subnet_id  = "${module.subnet-admin.subnet_id["${local.subnet_westus_admin_1}"]}"
        }
    }
}


module "vm-linux-jump-admin-01" {
    source                 = "../../shared-modules/avm/linux"
    resource_group_prefix  = local.rsg_pfx
    locations = {
        eastus = {
            lvm        = local.loc_eastus
            env        = local.var_env_admin
            nic_id     = "${module.nic-jump-admin-01.nic_id["nic-eastus-admin"]}"
            size       = local.vm_standard_size_eastus
        },
        westus = {
            lvm        = local.loc_westus
            env        = local.var_env_admin
            nic_id     = "${module.nic-jump-admin-01.nic_id["nic-westus-admin"]}"
            size       = local.vm_standard_size_westus
        }
    }
}
