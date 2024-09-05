terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  cloud {
    organization = "terraform67"

    workspaces {
      name = "terraformonazure-workspace"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "7ea1702d-d0c5-423b-ba9a-b69218aaf564"
}

resource "azurerm_resource_group" "taz" {
  name     = "terraformRG"
  location = "canada central"
}

module "securestorage" {
  source               = "app.terraform.io/terraform67/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.taz.location
  resource_group_name  = azurerm_resource_group.taz.name
  storage_account_name = "somexstore"
  environment = "dev"
}