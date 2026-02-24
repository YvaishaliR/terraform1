terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "tfstateaccount24022026"
    container_name       = "tfstate"
    key                  = "mg-landingzone.tfstate"
  }
}


provider "azurerm" {
  features{}
  subscription_id = "11c5480c-3b05-40bc-bc49-099960a2baf8"
}

provider "azurerm" {
  features {}
  subscription_id = "4d860e6c-bb22-40e0-b87f-5422973a6a54"
  alias           = "sub2"
}


