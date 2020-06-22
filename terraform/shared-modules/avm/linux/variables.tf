variable "resource_group_prefix"        {type = string}
variable "locations" {
  type = map(object({
    lvm            = string
    env            = string
    nic_id         = string
    size           = string
  }))
}
