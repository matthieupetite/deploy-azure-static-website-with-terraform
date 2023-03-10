terraform {
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "=1.2.1"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.39.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azurecaf" {
}

