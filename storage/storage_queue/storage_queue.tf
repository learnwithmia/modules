resource "azurerm_storage_queue" "queue" {
  for_each              = { for each in var.storage_queues : each.name => each }
  name                  = each.value.name
  storage_account_name  = "${var.env}store${each.value.account}"
}
