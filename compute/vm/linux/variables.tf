variable "linux_vm" {
  type = list(object({
    name                  = string
    resource_group_name   = string
    # admin_password        = string
    size                  = string
  }))
}

variable "env" {
  type = string
}

variable "location" {
  type = string  
}

variable "public_key" {
  type = string  
}

variable "tags" {
  type = map(string)  
}
