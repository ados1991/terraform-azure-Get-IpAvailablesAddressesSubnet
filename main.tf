
data "external" "get_ip_availables" {
    program = ["bash", "${path.module}/script/get_ip_availables.sh"]
    query = {
      subscription = "${var.subscription}"
      resource_group = "${var.resource_group}"
      vnet_name = "${var.vnet_name}"
      subnet_name = "${var.subnet_name}"
  }
}

