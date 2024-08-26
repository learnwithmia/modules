variable "security_groups" {
  type = list(object({
    name                = string
    # location            = string
    resource_group_name = string
    # tags                = optional(map(string))
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
