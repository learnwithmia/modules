variable "resource_groups" {
  type = list(object({
    name     = string
    # location = optional(string)
    # tags     = optional(map(string))
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
