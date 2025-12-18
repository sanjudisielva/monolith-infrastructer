data "azurerm_key_vault" "keyvault_data" {
  for_each            = var.vms
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}



