resource "local_file" "private_ssh_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/../ansible/ssh_key.pem"
  file_permission = "0600"
}

resource "local_file" "kubeconfig" {
  content  = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  filename = "${path.module}/../ansible/kubeconfig.yaml"
  file_permission = "0600"
}