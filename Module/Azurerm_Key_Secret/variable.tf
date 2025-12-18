variable "vms" {
  type = map(object({
    keyvault_secret_name   = string
    keyvault_secrets_value = optional(string)
    rg_name                = string
    keyvault_name          = string
  }))


}


