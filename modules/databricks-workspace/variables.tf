variable "prefix" {
  description = "This prefix will be included in the name of most resources."
  default = "demodb2"
}

variable "location" {
  description = "The region"
  default     = "eastus"
}

variable "resourcegroup" {
  description = "The resource group"
  default     = "demodb-rg"
}

variable "min_workers" {
  description = "Minimum workers in a cluster"
  default     = 1
}

variable "max_workers" {
  description = "Maximum workers in a cluster"
  default     = 2
}

variable "spark_version" {
  description = "Spark Runtime Version for databricks clusters"
  default     = "10.4.x-scala2.12"
}

variable "node_type_id" {
  description = "Type of worker nodes for databricks clusters"
  default     = "Standard_DS3_v2"
}

variable "demo_username" {
  type        = string
  description = "SQL user name."
  default     = "demouser"
}

variable "notebook_path" {
  description = "Path to a notebook"
  default     = "/notebook"
}
