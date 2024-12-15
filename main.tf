
data "azurerm_virtual_network" "hubvnet" {
  name                = "sr_hub_vnet"
  resource_group_name = "sr_hub_rsgroup"
}
data "azurerm_virtual_network" "sp1vnet" {
  name                = "sr_sp1_vnet"
  resource_group_name = "sr_sp1_rsgroup"
}
data "azurerm_virtual_network" "sp2vnet" {
  name                = "sr_sp2_vnet"
  resource_group_name = "sr_sp2_rsgroup"
}
resource "azurerm_virtual_network_peering" "hub-to-sp1" {
    name = "vnettovnet1"
    resource_group_name = "sr_hub_rsgroup"
    virtual_network_name = "sr_hub_vnet"
    remote_virtual_network_id = data.azurerm_virtual_network.sp1vnet.id
}
resource "azurerm_virtual_network_peering" "sp1-to-hub" {
    name = "vnet1tovnet"
    resource_group_name = "sr_sp1_rsgroup"
    virtual_network_name = "sr_sp1_vnet"
    remote_virtual_network_id = data.azurerm_virtual_network.hubvnet.id
}
resource "azurerm_virtual_network_peering" "hub-to-sp2" {
    name = "vnettovnet3"
    resource_group_name = "sr_hub_rsgroup"
    virtual_network_name = "sr_hub_vnet"
    remote_virtual_network_id = data.azurerm_virtual_network.sp2vnet.id
}
resource "azurerm_virtual_network_peering" "sp2-to-hub" {
    name = "vnet3tovnet"
    resource_group_name = "sr_sp2_rsgroup"
    virtual_network_name = "sr_sp2_vnet"
    remote_virtual_network_id = data.azurerm_virtual_network.hubvnet.id
}
