resource "azurerm_network_security_group" "security_group" {
  # for_each            = var.security_groups
  for_each            = { for each in var.security_groups : each.name => each }
  name                = "${var.env}-${each.value.name}"
  location            = var.location
  resource_group_name = "rg-${var.env}-${each.value.resource_group_name}"
  tags                = var.tags
}
