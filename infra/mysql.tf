resource "azurerm_mysql_flexible_server" "example" {
  name                   = "activity-planner-dev"
  resource_group_name    = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location
  administrator_login    = "adminuser"
  administrator_password = random_password.mysql_password.result
  backup_retention_days  = 7
  sku_name               = "B_Standard_B1ms"
  version = "8.0.21"
}

resource "random_password" "mysql_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

//TODO: Disable Secure Transport Required. Think this will do it: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_configuration