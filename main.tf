provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "example" {
  name                     = "abc" # The storage account name must be globally unique
  resource_group_name       = "1-c1d6b026-playground-sandbox"
  location                 = "East US"  # Update the location as needed
  account_tier              = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Terraform"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "terraform"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

