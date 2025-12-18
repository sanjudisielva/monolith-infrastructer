
# .................................
#   Nested Map of Resource Group
# .................................
rg_module = {
  rg1 = {
    rg_name     = "rg1_pre_prod"
    rg_location = "eastus"
    managed_by  = "sanjeev_gautam"
    tags = {
      env = "pre_prod1"
    }
  }
  rg2 = {
    rg_name     = "rg2_pre_prod"
    rg_location = "centralindia"
    managed_by  = "sanjeev_gautam"
    tags = {
      env = "pre_prod2"
    }
  }
}
# .................................
#   Nested Map of Virtual Network
# .................................
vnet_module = {
  v_net1 = {
    v_net_name    = "v-net_pre_prod1"
    rg_locataion  = "eastus"
    rg_name       = "rg1_pre_prod"
    address_space = ["10.0.0.0/16"]

  }
  v_net2 = {
    v_net_name    = "v-net_pre_prod2"
    rg_locataion  = "centralindia"
    rg_name       = "rg2_pre_prod"
    address_space = ["10.0.1.0/16"]

  }
}
# .................................
#   Nested Map of Subnet
# .................................
subnet_module = {
  Subnet1 = {
    subnet_name      = "subnet_pre_prod1"
    rg_name          = "rg1_pre_prod"
    v_net_name       = "v-net_pre_prod1"
    address_prefixes = ["10.0.1.0/24"]

  }
  Subnet2 = {
    subnet_name      = "subnet_pre_prod2"
    rg_name          = "rg1_pre_prod"
    v_net_name       = "v-net_pre_prod1"
    address_prefixes = ["10.0.2.0/24"]

  }
  Subnet3 = {
    subnet_name      = "subnet_pre_prod3"
    rg_name          = "rg2_pre_prod"
    v_net_name       = "v-net_pre_prod2"
    address_prefixes = ["10.0.1.0/24"]

  }
  Subnet4 = {
    subnet_name      = "subnet_pre_prod4"
    rg_name          = "rg2_pre_prod"
    v_net_name       = "v-net_pre_prod2"
    address_prefixes = ["10.0.2.0/24"]

  }
}
# .................................
#   Nested Map of NIC
# .................................
nic_module = {
  nic1 = {
    nic_name                      = "nic_pre_prod1"
    rg_location                   = "eastus"
    subnet_name                   = "subnet_pre_prod1"
    rg_name                       = "rg1_pre_prod"
    v_net_name                    = "v-net_pre_prod"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
  }
  nic2 = {
    nic_name                      = "nic_pre_prod2"
    rg_location                   = "eastus"
    subnet_name                   = "subnet_pre_prod1"
    rg_name                       = "rg1_pre_prod"
    v_net_name                    = "v-net_pre_prod"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
  }
}
# .................................
#   Nested Map of Public IP
# .................................
multiple_pip = {
  pip1 = {
    public_ip_name    = "public_ip_pre_prod1"
    rg_name           = "rg1_pre_prod"
    rg_location       = "eastus"
    allocation_method = "Static"

  }
  pip2 = {
    public_ip_name    = "public_ip_pre_prod2"
    rg_name           = "rg2_pre_prod"
    rg_location       = "eastus"
    allocation_method = "Static"
  }
}
# .................................
#   Nested Map of virtual machine
# .................................
multiple_vm = {
  vm1 = {
    vm_name      = "pre_prod-vm1"
    rg_name      = "rg1_pre_prod"
    rg_locataion = "eastus"
    vm_size      = "Standard_F2"
    # admin_username                  = data.azurerm_key_vault_secret.vm1_user_seceret[each.key].value
    # admin_password                  = data.azurerm_key_vault_secret.vm1_password_seceret[each.key].value
    disable_password_authentication = "false"
    vm_caching                      = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    vm_publisher                    = "canonical"
    vm_offer                        = "0001-com-ubuntu-server-jammy"
    vm_version                      = "22_04-lts"
    nic_name                        = "nic_pre_prod"
    vm_version                      = "latest"
    vm_sku                          = "22_04-lts"
    keyvault_name                   = "keyvault1-pre-prod"
  }
  vm2 = {
    vm_name      = "pre_prod-vm2"
    rg_name      = "rg1_pre_prod"
    rg_locataion = "eastus"
    vm_size      = "Standard_F2"
    # admin_username                  = data.azurerm_key_vault_secret.vm2_user_seceret[each.key].value
    # admin_password                  = data.azurerm_key_vault_secret.vm2_password_seceret[each.key].value
    disable_password_authentication = "false"
    vm_caching                      = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    vm_publisher                    = "canonical"
    vm_offer                        = "0001-com-ubuntu-server-jammy"
    vm_version                      = "22_04-lts"
    nic_name                        = "nic_pre_prod"
    vm_version                      = "latest"
    vm_sku                          = "22_04-lts"
    keyvault_name                   = "keyvault1-pre-prod"
  }
}
# .................................
#   Nested Map of Key Vault
# .................................
multiple_keyvault = {
  keyvault1 = {
    keyvault_name               = "keyvault1-pre-prod"
    rg_location                 = "eastus"
    rg_name                     = "rg1_pre_prod"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"

  }
  keyvault2 = {
    keyvault_name               = "keyvault2-pre-prod"
    rg_location                 = "centralindia"
    rg_name                     = "rg2_pre_prod"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"

  }
}
# ...................................
#   Nested Map of Key Vault Seceret
# ...................................
multiple_keysecret = {
  key_seceret = {
    keyvault_secret_name = "pre-prod-keyvault"
    rg_name              = "rg1_pre_prod"
    keyvault_name        = "eastus"

  }
}
