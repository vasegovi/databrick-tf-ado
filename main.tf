terraform {
   required_providers {
    databricks = {
      source = "databrickslabs/databricks"
      version = "0.5.5"
    }  
  } 
  backend "azurerm" {
    resource_group_name  = "demodb-rg"
    storage_account_name = "demodbtfstate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

locals {
  module_path        = abspath(path.module)  
}

module "databricks-workspace" {
  source = "./modules/databricks-workspace" 
  prefix = var.prefix
}

