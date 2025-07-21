resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name = var.aks_cluster_name
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix = "unir-cp2-amg-aks"

    default_node_pool {
      name = "default"
      node_count = 1
      vm_size = "Standard_D2s_v3"
    }

    identity {
      type = "SystemAssigned"
    }
  
}

resource "azurerm_role_assignment" "ra" {
    principal_id = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
    role_definition_name = "AcrPull"
    scope = azurerm_container_registry.acr.id
    skip_service_principal_aad_check = true
}