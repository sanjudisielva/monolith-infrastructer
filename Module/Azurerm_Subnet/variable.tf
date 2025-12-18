variable "todoapps" {
  type = map(object({
    subnet_name      = string
    rg_name          = string
    v_net_name       = string
    address_prefixes = list(string)

  }))

}
