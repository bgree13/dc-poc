variable "resource_group_prefix"        {type = string}
variable "locations" {
  type = map(object({
    nsg        = string
    env         = string
  }))
}
