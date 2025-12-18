
resource "azurerm_key_vault_secret" "keyvaultsecret" {
  for_each     = var.vms
  name         = each.value.keyvault_secret_name
  value        = each.value.keyvault_secrets_value
  key_vault_id = data.azurerm_key_vault.keyvault_data[each.key].id
}


  
