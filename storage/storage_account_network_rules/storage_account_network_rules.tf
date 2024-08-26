# use data source to get storage account id from name
data "azurerm_storage_account" "storage_accounts" {
  for_each            = { for each in var.storage_account_network_rules : each.name => each }  
  name                = "${var.env}store${each.value.name}"
  resource_group_name = "rg-${var.env}-storage"
}

# tfsec:ignore:azure-storage-allow-microsoft-service-bypass
resource "azurerm_storage_account_network_rules" "this" {
  for_each                 = { for each in var.storage_account_network_rules : each.name => each }  
  storage_account_id         = data.azurerm_storage_account.storage_accounts[each.key].id
  # tfsec:ignore:azure-storage-default-action-deny
  default_action             = each.value.default_action
  bypass                     = each.value.bypass
  # ip_rules                   = each.value.ip_rules
  ip_rules                   = var.ip_rules
  # virtual_network_subnet_ids = each.value.virtual_network_subnet_ids
  virtual_network_subnet_ids = var.virtual_network_subnet_ids
  # 2024-08-01 why do i need this? am i formatting the storage account id incorrectly?
  lifecycle {
    ignore_changes = [ storage_account_id ]
  }
}
