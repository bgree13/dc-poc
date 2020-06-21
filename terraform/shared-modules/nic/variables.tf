variable "resource_group_prefix"        {type = string}
variable "locations" {
  type = map(object({
    nic             = string
    env             = string
    subnet_id       = string
  }))
}
#variable "subnet_id"        {type = string}
