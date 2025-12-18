resource "azurerm_virtual_network" "v_net" {
  for_each            = var.multiple_v_net
  name                = each.value.v_net_name
  location            = each.value.rg_locataion
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers
}
