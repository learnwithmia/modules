variable "app_service_plans" {
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    tags                  = map(string)
    sku_size              = string
    sku_tier              = string
  }))
}
