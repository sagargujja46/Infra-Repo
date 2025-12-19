# variable "nics" {
#   type = map(object({
#      subnet_name = string
#     virtual_network_name = string
#     public_ip_name = string
#     name = string
#     location = string
#     resource_group_name = string

#     ip_configuration = map(object({
#       name = string
#       #subnet_id = string
#       private_ip_address_allocation = string
#     }))
#   }))
# }
variable "nics" {
  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    public_ip_name       = string
    name                 = string
    location             = string
    resource_group_name  = string

    ip_configuration = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}