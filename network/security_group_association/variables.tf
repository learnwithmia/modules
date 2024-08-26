variable "security_group_associations" {
  type = list(object({
    name                      = string
    subnet_id                 = string
    network_security_group_id = string
  }))
}
