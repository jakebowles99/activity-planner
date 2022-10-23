resource "azurerm_kubernetes_cluster" "res-0" {
  dns_prefix                       = "activityplannerdev-dns"
  http_application_routing_enabled = true
  location                         = "uksouth"
  name                             = "activityplannerdev"
  resource_group_name              = "activity-planner-dev"
  default_node_pool {
    enable_auto_scaling = true
    max_count           = 5
    min_count           = 1
    name                = "agentpool"
    vm_size             = "Standard_D2s_v3"
  }
  identity {
    type = "SystemAssigned"
  }
}
