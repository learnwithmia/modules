resource "azurerm_app_service_plan" "app_service_plan" {
    for_each              = var.app_service_plans
    name                  = each.value.name
    resource_group_name   = each.value.resource_group_name
    location              = each.value.location
    tags                  = each.value.tags
    kind                  = "Linux"
    reserved              = true
    sku {
        size = each.value.sku_size
        tier = each.value.sku_tier
    }
}
