output "ids" {
  value = values(azurerm_network_interface.network_interface)[*].id
}
