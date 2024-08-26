variable "network_interfaces" {
  type = list(object({
    name                 = string
    resource_group_name  = string
    ip_conf_name         = string
    network              = string
    subnet               = string
    public               = optional(bool, false)
  }))
}

variable "env" {
  type = string
}

variable "location" {
  type = string  
}

variable "tags" {
  type = map(string)  
}
