output "ids" {
  value = values(azurerm_subnet_network_security_group_association.security_group_associations)[*].id
}
