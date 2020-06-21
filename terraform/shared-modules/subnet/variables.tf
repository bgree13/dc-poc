variable "resource_group_prefix"        {type = string}
variable "locations" {
  type = map(object({
    vnet            = string
    addr_pfx        = string
    env             = string
  }))
}
