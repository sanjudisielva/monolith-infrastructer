variable "vms" {
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