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
