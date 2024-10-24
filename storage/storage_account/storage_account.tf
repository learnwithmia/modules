resource "azurerm_storage_account" "storage" {
  for_each                 = { for each in var.storage_accounts : each.name => each }  
  name                     = "${var.env}store${each.value.name}"
  resource_group_name      = "rg-${var.env}-storage"
  location                 = var.location
  tags                     = var.tags
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # tfsec
  min_tls_version          = "TLS1_2"
  # making it more secure
  public_network_access_enabled = each.value.public_network_access_enabled
  cross_tenant_replication_enabled = each.value.cross_tenant_replication_enabled
}
