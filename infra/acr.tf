resource "azurerm_container_registry" "acr" {
  name                = "activityplannerdev"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Standard"
  admin_enabled       = true
}