variable "resource_group_prefix"        {type = string}
variable "locations" {
  type = map(object({
    name        = string
    addr_pfx    = string
    avw_id      = string
  }))
}
