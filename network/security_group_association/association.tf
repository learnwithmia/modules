resource "azurerm_subnet_network_security_group_association" "security_group_associations" {
  # for_each = var.associations
  for_each = { for each in var.security_group_associations : each.name => each }
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.network_security_group_id
}
