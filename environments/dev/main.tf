module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "stg" {
  depends_on = [ module.rg ]
  source     = "../../modules/azurerm_storage_account"
  stgs       = var.stgs

}
module "vnet" {
  depends_on = [ module.rg ]
  source   = "../../modules/azurerm_virtual_network"
  networks = var.networks
}

module "nics" {
  depends_on = [ module.rg, module.vnet, module.pip ]
  source   = "../../modules/azurerm_nic"
  nics     = var.nics
}

module "pip" {
  depends_on = [ module.rg ]
  source     = "../../modules/azurerm_pip"
  pips       = var.pips
}

module "vms" {
  depends_on = [ module.rg, module.nics ]
  source   = "../../modules/azurerm_virtual_machine"
  vms      = var.vmlinux_vms
}





