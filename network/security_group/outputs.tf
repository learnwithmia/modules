output "ids" {
  value = values(azurerm_network_security_group.security_group)[*].id
}
