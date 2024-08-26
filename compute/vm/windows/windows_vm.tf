resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
    for_each              = { for each in var.windows_vm : each.name => each }
    name                  = "${var.env}-${each.value.name}"
    resource_group_name   = var.resource_group_name
    location              = var.location
    tags                  = each.value.tags
    admin_password        = each.value.admin_password
    admin_username        = each.value.admin_username
    custom_data           = base64encode("export ENV=${var.env}")
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
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = each.value.sku
        version   = "latest"
    }
}
