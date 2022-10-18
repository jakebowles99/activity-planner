resource "azurerm_mysql_flexible_server" "example" {
  name                   = "activity-planner-dev"
  resource_group_name    = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location
  administrator_login    = "adminuser"
  administrator_password = "M0Nday123!?***!"
  backup_retention_days  = 7
  sku_name               = "B_Standard_B1ms"
  version = "8.0.21"
}