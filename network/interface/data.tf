data "azurerm_subscription" "current" {}

# # SOMEWHAT HARDCODED
# data "azurerm_public_ip" "bastion_public_ip" {
#   name                = "${var.env}-bastion-public"
#   resource_group_name = "rg-${var.env}-network"
# }

data "azurerm_subnet" "subnet" {
  for_each             = { for each in var.network_interfaces : each.name => each }
  name                 = "${var.env}-${each.value.subnet}"
  virtual_network_name = "${var.env}-${each.value.network}"
  resource_group_name  = "rg-${var.env}-${each.value.resource_group_name}"
}
