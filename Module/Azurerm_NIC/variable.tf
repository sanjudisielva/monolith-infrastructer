variable "network_interface_card" {
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




