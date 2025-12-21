variable "rgs" {
  type = map(object(
    {
      name       = string
      location   = string
      managed_by = optional(string)
      tags       = optional(map(string))
    }
  ))
}

variable "stgs" {
  type = map(object(
    {
      name                     = string
      resource_group_name      = string
      location                 = string
      account_tier             = string
      account_replication_type = string
    }
  ))

}

variable "networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnet = optional(map(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}

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
#       subnet_id = string
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

variable "pips" {
  description = "A map of Public IP configurations"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}

variable "linuxvm" {
  description = "A map of virtual machine configurations"
  type = map(object({
    vm_name                      = string
    rg_name                      = string
    location                     = string
    vm_size                      = string
    admin_username               = string
    admin_password               = string
    nic_name                     = string
    os_disk_caching              = string
    os_disk_storage_account_type = string
    vm_publisher                 = string
    vm_offer                     = string
    vm_sku                       = string
    vm_version                   = string
    custom_data                  = optional(string)
  }))
}


