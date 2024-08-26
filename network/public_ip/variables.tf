variable "public_ips" {
  type = list(object({
    name                = string
    resource_group_name = string
    sku                 = string
    domain_name_label   = optional(string)
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
