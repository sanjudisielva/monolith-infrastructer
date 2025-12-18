resource "azurerm_network_interface" "nic" {
    for_each = var.network_interface_card
  name                = each.value.nic_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}