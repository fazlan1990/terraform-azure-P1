terraform {
  required_version = ">= 1.3.0"

  backend "azurerm" {
    resource_group_name  = "RG1"
    storage_account_name = "fasstorage90"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "RG6"
  location = "West US 2"
}

resource "azurerm_storage_account" "storage" {
  name                     = "faslanstr4548678"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}



