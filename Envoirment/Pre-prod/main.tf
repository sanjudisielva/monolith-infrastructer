# ..........................
# Module of resource Group
# ..........................

module "resource_group" {
  source       = "../../Module/Azurerm_Resource_Group"
  multiple_rgs = var.rg_module
}

# ..........................
# Module of V-Net
# ..........................
module "v_net" {
  source         = "../../Module/Azurerm_Virtual_Network"
  multiple_v_net = var.vnet_module
  depends_on     = [module.resource_group]
}
# ..........................
# Module of Sub-Net
# ..........................

module "subnet" {
  source     = "../../Module/Azurerm_Subnet"
  todoapps   = var.subnet_module
  depends_on = [module.v_net]

}
# ..........................
# Module of NIC
# ..........................

module "network_ic" {
  source                 = "../../Module/Azurerm_NIC"
  network_interface_card = var.nic_module
  depends_on             = [module.subnet]
}

# ..........................
# Module of  pubil ip
# ..........................
module "pip" {
  source    = "../../Module/Azurerm_Public_IP"
  public_ip = var.multiple_pip
}
# ................................
# Module of  Linux Virtual Machine
# ................................


module "linux_vm" {
  source     = "../../Module/Azurerm_Linux_VM"
  vms        = var.multiple_vm
  depends_on = [module.network_ic, module.Key_Vault, module.key_secret]
}
# ................................
# Module of  Key Vault 
# ................................

module "Key_Vault" {
  source     = "../../Module/Azurerm_Key_Vault"
  vms        = var.multiple_keyvault
  depends_on = [module.resource_group]
}
# ................................
# Module of  Key Vault secret
# ................................

module "key_secret" {
  source     = "../../Module/Azurerm_Key_Secret"
  vms        = var.multiple_keysecret
  depends_on = [module.Key_Vault]
}
