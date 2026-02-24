data "azurerm_subscription" "sub1" {
    subscription_id = var.sub1 
}

data "azurerm_subscription" "sub2" {
    subscription_id = var.sub2 
}

resource "azurerm_management_group" "corp" {
  
  display_name = "Corp"

}

resource "azurerm_management_group" "platform" {
  display_name               = "Platform"
  parent_management_group_id = azurerm_management_group.corp.id

}

resource "azurerm_management_group" "landingzone" {
  display_name               = "LandingZone"
  parent_management_group_id = azurerm_management_group.corp.id

}

resource "azurerm_management_group" "dev" {
  display_name               = "Dev"
  parent_management_group_id = azurerm_management_group.landingzone.id

}

resource "azurerm_management_group" "prod" {
  display_name               = "Prod"
  parent_management_group_id = azurerm_management_group.landingzone.id
  
}

resource "azurerm_management_group_subscription_association" "platform_sub" {
  management_group_id = azurerm_management_group.platform.id
  subscription_id     = data.azurerm_subscription.sub1.id
}

resource "azurerm_management_group_subscription_association" "prod_sub" {
  management_group_id = azurerm_management_group.prod.id
  subscription_id     = data.azurerm_subscription.sub2.id
}