resource "azurerm_public_ip" "pip" {
  for_each            = var.public_ip
  name                = each.value.public_ip_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  allocation_method   = each.value.allocation_method
  tags                = each.value.tags
}
