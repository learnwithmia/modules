variable "vnets" {
  type = list(object({
    name                = string
    # location            = string
    resource_group_name = string
    # tags                = optional(map(string))
    address_space       = list(string)
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
