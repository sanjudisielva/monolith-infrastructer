resource "azurerm_linux_virtual_machine" "virtualmachin" {
  for_each            = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_locataion
  size                = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret.vm1_user_seceret[each.key].value
  admin_password      = data.azurerm_key_vault_secret.vm1_password_seceret[each.key].value
  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id,
  ]

  disable_password_authentication = each.value.disable_password_authentication

  os_disk {
    caching              = each.value.vm_caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.vm_publisher
    offer     = each.value.vm_offer
    sku       = each.value.vm_sku
    version   = each.value.vm_version
  }
}
