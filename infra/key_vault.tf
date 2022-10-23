data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                        = "activityplanner"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"


}

resource "azurerm_key_vault_access_policy" "aks" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_kubernetes_cluster.res-0.kubelet_identity[0].object_id

  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]
      certificate_permissions = [
        "Get",
    ]

}

resource "azurerm_key_vault_access_policy" "user" {
  key_vault_id = azurerm_key_vault.main.id
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge"
    ]

    certificate_permissions = [
        "Get",
        "List",
        "Create"
    ]

}

resource "azurerm_key_vault_secret" "mysql" {
  name         = "mysql-password"
  value        = random_password.mysql_password.result
  key_vault_id = azurerm_key_vault.main.id
}