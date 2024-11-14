resource "azurerm_resource_group" "example" {
  name     = "o2-aks-kafka-example"
  location = "northeurope"
}


resource "azurerm_kubernetes_cluster" "example" {
  name                              = "o2-aks-kafka-example"
  location                          = azurerm_resource_group.example.location
  resource_group_name               = azurerm_resource_group.example.name
  dns_prefix                        = "o2example"
  kubernetes_version                = "1.30"
  role_based_access_control_enabled = true

  default_node_pool {
    name                        = "o2example"
    temporary_name_for_rotation = "o2example2"
    node_count                  = 3
    vm_size                     = "Standard_D4s_v3"

    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    service_cidr      = "10.43.0.0/16"
    dns_service_ip    = "10.43.0.10"
    load_balancer_sku = "standard"
  }
}

output "kubeconfig" {
  value     = azurerm_kubernetes_cluster.example.kube_config_raw
  sensitive = true
}
