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
  sku                           = "premium"
}

resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = "${var.prefix}-Autoscaling-Cluster"
  spark_version           = var.spark_version
  node_type_id            = var.node_type_id
  autotermination_minutes = 20
  autoscale {
    min_workers = var.min_workers
    max_workers = var.max_workers
  }
}

resource "databricks_secret_scope" "demo-scope" {
  name = "demo-scope"
}

resource "databricks_secret" "demo_username" {
  key          = "demo_username"
  string_value = var.demo_username
  scope        = databricks_secret_scope.demo-scope.id
}

resource "databricks_notebook" "notebook" {
  content_base64 = base64encode("dbutils.secrets.list(scope=\"demo-scope\")")
  path = var.notebook_path
  language = "SCALA"
}
