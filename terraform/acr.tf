resource "azurerm_user_assigned_identity" "acr_identity" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "${var.acr_name}-identity"
}


resource "azurerm_container_registry" "acr" {
  name                  = var.acr_name
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  sku                   = "Basic"
  admin_enabled         = true
  data_endpoint_enabled = false

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.acr_identity.id]
  }
}
