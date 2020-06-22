variable "resource_group_prefix"        {type = string}
variable "locations" {
  type = map(object({
    name        = string
  }))
}
