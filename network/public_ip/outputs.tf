output "fqdn" {
  value = values(azurerm_public_ip.public_ip)[*].fqdn
}

output "ids" {
  value = values(azurerm_public_ip.public_ip)[*].id
}

output "ip_address" {
  value = values(azurerm_public_ip.public_ip)[*].ip_address
}
