resource "azurerm_public_ip" "public_ip" {
  # for_each            = var.public_ips
  for_each            = { for each in var.public_ips : each.name => each }
  name                = "${var.env}-${each.value.name}"
  location            = var.location
  resource_group_name = "rg-${var.env}-${each.value.resource_group_name}"
  allocation_method   = "Static"
  domain_name_label   = each.value.domain_name_label
  sku                 = each.value.sku
  tags                = var.tags
  lifecycle {
    create_before_destroy = true
  }
}
