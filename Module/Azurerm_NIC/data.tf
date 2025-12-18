data "azurerm_subnet" "subnet" {
    for_each = var.network_interface_card
  name                 = each.value.subnet_name
  virtual_network_name = each.value.v_net_name
  resource_group_name  = each.value.rg_name
}