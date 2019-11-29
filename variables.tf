variable "subscription" {
  description = "Subscription of resource group"
}

variable "resource_group" {
  description = "Resource group of vnet"
}

variable "vnet_name" {
  description = "Vnet of subnet"
}

variable "subnet_name" {
  description = "Subnet name"
}

variable "delimiter" {
  default = ","
}
