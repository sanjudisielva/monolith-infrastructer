data "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "keyvault_data" {
  for_each            = var.vms
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}
# .................................................
# Data block of Seceret Value of VM1
# .................................................
data "azurerm_key_vault_secret" "vm1_user_seceret" {
  for_each     = var.vms
  name         = "vm1-username"
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}

data "azurerm_key_vault_secret" "vm1_password_seceret" {
  for_each     = var.vms
  name         = "vm1-password"
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}

# .................................................
# Data block of Seceret Value of VM2
# .................................................

data "azurerm_key_vault_secret" "vm2_user_seceret" {
  for_each     = var.vms
  name         = "vm2-username"
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}

data "azurerm_key_vault_secret" "vm2_password_seceret" {
  for_each     = var.vms
  name         = "vm2-password"
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}
