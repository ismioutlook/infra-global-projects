locals {
    aks_subnet_id_eu = data.azurerm_subnet.subnet_aks_eu.name
    aks_subnet_id_us = data.azurerm_subnet.subnet_aks_us.name
}