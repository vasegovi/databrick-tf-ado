terraform {
   required_providers {
    databricks = {
      source = "databrickslabs/databricks"
      version = "0.5.5"
    }  
  } 
}

provider "azurerm" {
    features {}
}

provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.myworkspace.id
}

resource "azurerm_databricks_workspace" "myworkspace" {
  location                      = "${var.location}"
  name                          = "${var.prefix}-workspace"
  resource_group_name           = "${var.resourcegroup}"
  sku                           = "standard"
}
