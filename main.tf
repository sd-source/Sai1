provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resourcegroup" {
  name     = "${var.envname}rg"
  location = var.location
}

resource "azurerm_storage_account" "storageaccountname" {
  name                     = "${var.envname}storbcd000${var.regioncode}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = var.sku

  tags = {
    environment = var.envname
  }
}
