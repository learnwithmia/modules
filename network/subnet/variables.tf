variable "subnets" {
  type = list(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
    service_endpoints    = optional(list(string))
  }))
}

variable "env" {
  type = string
}
