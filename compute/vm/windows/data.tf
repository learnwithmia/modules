data "azurerm_network_interface" "network_interface" {
  for_each              = { for each in var.windows_vm : each.name => each }
  name                 = "${var.env}-${each.value.name}"
  resource_group_name = "rg-${var.env}-networK"
}
