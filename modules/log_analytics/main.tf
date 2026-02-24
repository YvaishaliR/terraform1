resource "azurerm_log_analytics_workspace" "la" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags=var.tags
}