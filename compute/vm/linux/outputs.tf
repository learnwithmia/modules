output "ids" {
  value = values(azurerm_linux_virtual_machine.linux_virtual_machine)[*].id
}

output "ips" {
  value = values(azurerm_linux_virtual_machine.linux_virtual_machine)[*].public_ip_addresses
}

output "principal_ids" {
  value = values(azurerm_linux_virtual_machine.linux_virtual_machine)[*].identity[0].principal_id
}