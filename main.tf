resource "azurerm_resource_group" "rg" {
    name     = "bensykes-dev-rg"
    location = "canadacentral"
}

resource "azurerm_storage_account" "sa" {
    name                     = "generalstorageaccount"
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "dev"
    }
}