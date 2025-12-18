
resource "azurerm_subnet" "subnet" {
    for_each = var.todoapps
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.v_net_name
  address_prefixes     = each.value.address_prefixes
}