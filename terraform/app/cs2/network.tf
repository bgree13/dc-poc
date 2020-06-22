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
          avh_id    = "${module.vhub-cloud.avh_id["avh-eastus"]}"
      },
      westus = {
          name   = local.loc_westus
          avh_id    = "${module.vhub-cloud.avh_id["avh-westus"]}"
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

module "nsg-dev-01" {
    source                 = "../../shared-modules/nsg"
    resource_group_prefix  = local.rsg_pfx
    locations = {
        eastus = {
            nsg        = local.loc_eastus
            env        = local.var_env_dev
        },
        westus = {
            nsg        = local.loc_westus
            env        = local.var_env_dev
        }
    }
}
