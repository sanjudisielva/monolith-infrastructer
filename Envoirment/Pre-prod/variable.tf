# ..........................
# variable of resource Group
# ..........................
variable "rg_module" {
  type = map(object({
    rg_name     = string
    rg_location = string
    managed_by  = optional(string)
    tags        = optional(map(string))
  }))
}
# ...........................
# variable of V-Net
# ..........................
variable "vnet_module" {
  type = map(object({
    v_net_name    = string
    rg_locataion  = string
    rg_name       = string
    address_space = list(string)
    dns_servers   = optional(list(string))
  }))

}
# ..........................
# variable of subnet
# ..........................
variable "subnet_module" {
  type = map(object({
    subnet_name      = string
    rg_name          = string
    v_net_name       = string
    address_prefixes = list(string)

  }))

}
# ..........................
# variable of NIC
# ..........................
variable "nic_module" {
  type = map(object({
    nic_name                      = string
    rg_location                   = string
    rg_name                       = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    subnet_name                   = string
    v_net_name                    = string
  }))

}
# ..........................
# variable of Public IP
# ..........................
variable "multiple_pip" {
  type = map(object({
    public_ip_name    = string
    rg_name           = string
    rg_location       = string
    allocation_method = string
    tags              = optional(map(string))
  }))
}
# ..............................
# variable of virtual machine
# ..............................
variable "multiple_vm" {
  type = map(object({
    vm_name                         = string
    rg_name                         = string
    rg_locataion                    = string
    vm_size                         = string
    admin_password                  = optional(string)
    admin_username                  = optional(string)
    vm_caching                      = optional(string)
    storage_account_type            = optional(string)
    vm_publisher                    = string
    vm_offer                        = string
    vm_sku                          = string
    vm_version                      = string
    nic_name                        = string
    disable_password_authentication = bool
    keyvault_name                   = string
  }))
}
# ..............................
# variable of Key Vault
# ..............................
variable "multiple_keyvault" {
  type = map(object({
    keyvault_name               = string
    rg_location                 = string
    rg_name                     = string
    enabled_for_disk_encryption = string
    soft_delete_retention_days  = string
    purge_protection_enabled    = string
    sku_name                    = string
  }))
}
# ..............................
# variable of Key Vault Seceret
# ..............................
variable "multiple_keysecret" {
  type = map(object({
    keyvault_secret_name   = string
    keyvault_secrets_value = optional(string)
    rg_name                = string
    keyvault_name          = string
  }))
}
