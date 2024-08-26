variable "storage_account_network_rules" {
  type = list(object({
    name                       = string
    default_action             = optional(string, "Allow")
    bypass                     = optional(list(string))
    # ip_rules                   = optional(list(string))
    # virtual_network_subnet_ids = optional(list(string))
  }))
  # default = [
  #   {
  #     name           = "null"
  #     default_action = "Allow"
  #   } 
  # ]
}

variable "env" {
  type = string
}

variable "ip_rules" {
  type = list(string)
}

variable "virtual_network_subnet_ids" {
  type = list(string)
}
