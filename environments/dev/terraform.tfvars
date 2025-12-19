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
    name ="todo-vnet"
    location = "eastus"
    resource_group_name = "rg-chitti"
    address_space = ["10.0.0.0/16"]
    subnet = {

       subnet1 = {
        name = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
       }
      subnet2 = {
        name = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
       }
    }
  }
}

nics = {
  nic1 = {
    subnet_name = "frontend-subnet"
    virtual_network_name = "todo-vnet"
    resource_group_name = "rg-chitti"
    public_ip_name = ""
    name = "nic-01"
    location = "eastus"
    
    ip_configuration = {
      ipconfig1 = {
        name = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

pips = {
  pip1 = {
    name = "pip1"
    location = "eastus"
    resource_group_name = "rg-chitti"
    allocation_method = "Static"
     }
}

vmlinux_vms = {
 vms = {
   vm1 = {
    name = "linux-vm-01"
    location = "eastus"
    resource_group_name = "rg-chitti"
    network_interface_ids = ["nic-01"]
    vm_size = "Standard_B1s"
    admin_username = "sagarvm"
    admin_password = "P@ssw0rd1234!"
    os_disk_caching = "ReadWrite"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"

      custom_data                  = <<-EOT
      #!/bin/bash
      sudo apt update
      sudo apt upgrade -y
      sudo apt install -y nginx
      sudo rm -rf /var/www/html/*
      git clone https://github.com/devopsinsiders/StreamFlix.git /var/www/html/
      systemctl enable nginx
      systemctl start nginx
    EOT
  }
    }
   }
 }



