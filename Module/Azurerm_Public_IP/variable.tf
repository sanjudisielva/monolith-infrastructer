variable "public_ip" {
  type = map(object({
    public_ip_name    = string
    rg_name           = string
    rg_location       = string
    allocation_method = string
    tags=map(string)
  }))
}
