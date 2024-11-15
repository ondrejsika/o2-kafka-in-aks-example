resource "azurerm_public_ip" "kafka" {
  count = 3

  name                = "kafka-${count.index}"
  resource_group_name = azurerm_kubernetes_cluster.example.node_resource_group
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

output "ips" {
  value = {
    for ip in azurerm_public_ip.kafka : "${ip.name}" => ip.ip_address
  }
}
