rgs = {
  rg1 = {
    name       = "rg-chitti"
    location   = "eastus"
    managed_by = "chitti-terraform"
    tags = {
      environment = "Development"
    }
  }
}

stgs = {
  stg1 = {
    name                     = "stgchitti12345"
    resource_group_name      = "rg-chitti"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "Development"
    }
  }
}

networks = {
  "vnet1" = {
    name                = "todo-vnet"
    location            = "eastus"
    resource_group_name = "rg-chitti"
    address_space       = ["10.0.0.0/16"]
    subnet = {

      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

nics = {
  nic1 = {
    subnet_name          = "frontend-subnet"
    virtual_network_name = "todo-vnet"
    resource_group_name  = "rg-chitti"
    public_ip_name       = ""
    name                 = "nic-01"
    location             = "eastus"

    ip_configuration = {
      ipconfig1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

pips = {
  pip1 = {
    name                = "pip1"
    location            = "eastus"
    resource_group_name = "rg-chitti"
    allocation_method   = "Static"
  }
}

linuxvm = {
  vm1 = {
    vm_name                      = "linux-vm-01"
    rg_name                      = "rg-chitti"
    location                     = "eastus"
    vm_size                      = "Standard_B1s"
    admin_username               = "azureuser"
    admin_password               = "P@ssw0rd1234!"
    nic_name                     = "nic-01"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    vm_publisher                 = "Canonical"
    vm_offer                     = "UbuntuServer"
    vm_sku                       = "18.04-LTS"
    vm_version                   = "latest"
  }
}



