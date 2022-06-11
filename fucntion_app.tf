provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "myrmdLabRG"
  location = "eastus2"
}

resource "azurerm_storage_account" "example" {
  name                     = "myrmdlabstorageacc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = "myrmdLabSP"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_function_app" "example" {
  name                = "myrmdLab-linux-function-app"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  storage_account_name = azurerm_storage_account.example.name
  service_plan_id      = azurerm_service_plan.example.id

  site_config {}
}
