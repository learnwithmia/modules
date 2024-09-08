resource "azurerm_resource_group" "this" {
  for_each = { for each in var.resource_groups : each.name => each }
  # name     = each.value.name
  # location = each.value.location
  name     = "rg-${var.env}-${each.value.name}"
  location = var.location
  tags     = var.tags
}
