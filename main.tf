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

data "external" "get_ip_availables" {
    program = ["bash", "${path.module}/script/get_ip_availables.sh"]
    query = {
      subscription = "${var.subscription}"
      resource_group = "${var.resource_group}"
      vnet_name = "${var.vnet_name}"
      subnet_name = "${var.subnet_name}"
  }
}

output "ip_availables" {
  value = "${split(var.delimiter, data.external.get_ip_availables.result.data)}"
}
