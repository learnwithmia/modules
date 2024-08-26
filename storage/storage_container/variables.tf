variable "storage_containers" {
  type = list(object({
    name    = string
    account = string
    body = map(map(string))
    # container_access_type = string
  }))
}

variable "env" {
  type = string
}

# variable "container_access_type" {
#   type = string  
# }
