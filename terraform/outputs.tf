output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "acr_hostname" {
  value = "${azurerm_container_registry.acr.name}.azurecr.io"
}

output "acr_username" {
  value = azurerm_container_registry.acr.admin_username
}


output "acr_userpasswd" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "vm_public_ip_address" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}

output "private_ssh_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "public_ssh_key" {
  value     = tls_private_key.ssh_key.public_key_openssh
  sensitive = true
}


output "vm_admin_username" {
  value = var.vm_admin_username
}

output "ssh_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "ssh_public_key" {
  value     = tls_private_key.ssh_key.public_key_openssh
  sensitive = true
}

