output "ip_availables" {
  value = "${split(var.delimiter, data.external.get_ip_availables.result.data)}"
}

