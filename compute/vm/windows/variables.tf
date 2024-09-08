variable "windows_vm" {
  type = list(object({
    name                  = string
    # resource_group_name   = string
    # tags                  = optional(map(string))
    admin_password        = string
    admin_username        = string
    size                  = string
    sku                   = string
  }))
}

variable "env" {
  type = string
}

variable "location" {
  type = string  
}

variable "resource_group_name" {
  type = string  
}

variable "tags" {
  type = map(string)  
}
