variable "vms" {
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





