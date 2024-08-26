output "ids" {
  value = values(azurerm_storage_account.storage)[*].id
}
