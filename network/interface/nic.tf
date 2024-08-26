resource "azurerm_network_interface" "network_interface" {
  # for_each            = var.network_interfaces
  for_each            = { for each in var.network_interfaces : each.name => each }
  name                = "${var.env}-${each.value.name}"
  lifecycle {
    ignore_changes = [ 
      ip_configuration
    ]
  }
  location            = var.location
  resource_group_name = "rg-${var.env}-${each.value.resource_group_name}"
  tags                = var.tags
  ip_configuration {
    name                          = "${var.env}-${each.value.ip_conf_name}"
    subnet_id                     = data.azurerm_subnet.subnet["${each.key}"].id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = data.azurerm_public_ip.public_ip["${each.key}"].id    
    public_ip_address_id = each.value.public ? "${data.azurerm_subscription.current.id}/resourceGroups/rg-${var.env}-network/providers/Microsoft.Network/publicIPAddresses/${var.env}-public-${each.value.name}" : null
  }
}
