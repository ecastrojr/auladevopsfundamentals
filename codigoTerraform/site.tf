# Terraform Settings Block
terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
# Create Resource Group 
resource "azurerm_resource_group" "rg" {
  location = "eastus"
  name     = "rg-auladevops-001"
  tags = merge(var.tags, {
    "workspace" = "${terraform.workspace}"
    }
  )
}

resource "azurerm_storage_account" "site" {
  name                      = "staccdevops001"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"

  tags = merge(var.tags, {
    "workspace" = "${terraform.workspace}"
    }
  )
}
  resource azurerm_storage_account_static_website "website"{
    storage_account_id = azurerm_storage_account.site.id
    index_document = "index.html"
  }