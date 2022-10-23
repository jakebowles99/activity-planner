terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
      backend "azurerm" {
      resource_group_name  = "state"
      storage_account_name = "terraformactivityplanner"
      container_name       = "tfstate"
      key                  = "dev.terraform.tfstate"
    }
}