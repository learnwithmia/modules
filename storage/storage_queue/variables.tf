variable "storage_queues" {
  type = list(object({
    name    = string
    account = string
  }))
}

variable "env" {
  type = string
}
