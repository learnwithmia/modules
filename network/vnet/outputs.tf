output "ids" {
  value = values(azurerm_virtual_network.virtual_network)[*].id
}
output "names" {
  value = values(azurerm_virtual_network.virtual_network)[*].name
}
