data "azurerm_network_interface" "nic_id" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}