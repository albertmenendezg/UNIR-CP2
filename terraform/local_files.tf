resource "local_file" "ansible_inventory" {
  depends_on = [azurerm_linux_virtual_machine.vm]
  content = templatefile("inventory.tmpl", {
    vm_ip             = azurerm_public_ip.vm_public_ip.ip_address
    vm_admin_username = var.vm_admin_username
    acr_username      = azurerm_container_registry.acr.admin_username
    acr_password      = azurerm_container_registry.acr.admin_password
    acr_name          = azurerm_container_registry.acr.name
    ssh_key_path      = local_file.private_ssh_key.filename
  })
  filename = "${path.module}/../ansible/inventory"
}

resource "local_file" "private_ssh_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/../ansible/ssh_key.pem"
  file_permission = "0600"
}

resource "local_file" "kubeconfig" {
  content         = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  filename        = "${path.module}/../ansible/kubeconfig.yaml"
  file_permission = "0600"
}