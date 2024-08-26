resource "azurerm_network_security_rule" "security_rule" {
  # for_each                    = var.security_rules
  for_each                    = { for each in var.security_rules : each.name => each }
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  # tfsec:ignore:azure-network-ssh-blocked-from-internet tfsec:ignore:azure-network-disable-rdp-from-internet tfsec:ignore:azure-network-no-public-ingress
  source_address_prefixes     = var.source_address_prefixes
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = "rg-${var.env}-${each.value.resource_group_name}"
  network_security_group_name = "${var.env}-${each.value.network_security_group_name}"
}
