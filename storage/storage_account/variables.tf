variable "storage_accounts" {
  type = list(object({
    name                = string
    # resource_group_name = string
    # location            = string
    public_network_access_enabled = optional(bool, false)
    cross_tenant_replication_enabled = optional(bool, false)
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
