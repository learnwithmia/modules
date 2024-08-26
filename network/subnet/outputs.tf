output "ids" {
  value = values(azurerm_subnet.subnet)[*].id
}
