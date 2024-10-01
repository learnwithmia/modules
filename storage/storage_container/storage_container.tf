terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
  }
}

# provider "azapi" {
#   # Configuration options
# }

# resource "azurerm_storage_container" "container" {
#   for_each              = { for each in var.storage_containers : each.name => each }
#   name                  = each.value.name
#   storage_account_name  = "${var.env}store${each.value.account}"
#   # tfsec:ignore:azure-storage-no-public-access
#   container_access_type = "container"
# }

# use data source to get storage account id from name
data "azurerm_storage_account" "storage_accounts" {
  for_each            = { for each in var.storage_containers : each.name => each }  
  name                = "${var.env}store${each.value.account}"
  resource_group_name = "rg-${var.env}-storage"
}

# # 2024-07-25 changed to azapi to avoid AzureRM issues (storage account network rules / storage firewall blocks the traffic to data plane)
resource "azapi_resource" "blob_containers" {
  for_each  = { for each in var.storage_containers : each.name => each }
  type      = "Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01"
  # type      = "Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01" # 2024-09-09 new version
  name      = each.value.name
  parent_id = "${data.azurerm_storage_account.storage_accounts[each.key].id}/blobServices/default"
  body      = jsonencode( each.value.body )
  # 2024-08-01 why do i need this? am i formatting the parent id incorrectly?
  lifecycle {
    ignore_changes = [ parent_id ]
  }
}
