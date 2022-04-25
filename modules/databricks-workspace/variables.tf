variable "prefix" {
  description = "This prefix will be included in the name of most resources."
  default = "demodb"
}

variable "location" {
  description = "The region"
  default     = "centralus"
}

variable "resourcegroup" {
  description = "The resource group"
  default     = "demodb-rg"
}