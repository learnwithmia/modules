resource "azurerm_subnet" "subnet" {
  # for_each             = var.subnets
  for_each             = { for each in var.subnets : each.name => each }
  name                 = "${var.env}-${each.value.name}"
  resource_group_name  = "rg-${var.env}-${each.value.resource_group_name}"
  virtual_network_name = "${var.env}-${each.value.virtual_network_name}"
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints
}
