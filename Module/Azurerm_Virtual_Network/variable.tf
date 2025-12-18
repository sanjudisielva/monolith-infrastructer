variable "multiple_v_net" {
  type = map(object({
    v_net_name  = string
    rg_locataion  = string
    rg_name       = string
    address_space = list(string)
    dns_servers   = optional(list(string))
  }))

}
