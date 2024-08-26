resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
    for_each              = { for each in var.linux_vm : each.name => each }
    name                  = "${var.env}-${each.value.name}"
    resource_group_name   = "rg-${var.env}-${each.value.resource_group_name}"
    location              = var.location
    tags                  = var.tags
    admin_username        = "ubuntu"
    admin_ssh_key {
      username            = "ubuntu"
      public_key          = var.public_key
    }
    disable_password_authentication = true
    # admin_password        = each.value.admin_password
    encryption_at_host_enabled      = true
    # disable_password_authentication = false
    identity {
      type = "SystemAssigned"
    }
    lifecycle {
      ignore_changes = [ 
        network_interface_ids
      ]
    }
    network_interface_ids = [ data.azurerm_network_interface.network_interface["${each.key}"].id ]
    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    size                  = each.value.size
    source_image_reference {
        # publisher = "Canonical"
        # offer     = "0001-com-ubuntu-server-focal"
        # sku       = "20_04-lts"
        # version   = "latest"
        # 2024-04-03 trying 22.04
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
}
