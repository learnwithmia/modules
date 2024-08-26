resource "azurerm_virtual_network" "virtual_network" {
  # for_each            = var.vnets
  for_each            = { for each in var.vnets : each.name => each }
  name                = "${var.env}-${each.value.name}"
  location            = var.location
  resource_group_name = "rg-${var.env}-${each.value.resource_group_name}"
  tags                = var.tags
  address_space       = each.value.address_space
}
