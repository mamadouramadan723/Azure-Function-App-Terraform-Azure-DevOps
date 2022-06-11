provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "myrmdLab-RG"
  location = "eastus2"
}

resource "azurerm_service_plan" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}