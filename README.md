# Find free IP inside a vnet/subnet in azure tenant


## Install module from git

```
module "get_ips" {
    source = "https://github.com/ados1991/terraform-azure-Get-IpAvailablesAddressesSubnet.git"
    subscription = "xxx-to provide-xxx"
    resource_group = "xxx-to provide-xxx"
    vnet_name = "xxx-to provide-xxx"
    subnet_name = "xxx-to provide-xxx"
}
```

## Install module from terraform registry

```
module "get_ips" {
    source = "ados1991/Get-IpAvailablesAddressesSubnet/azure"
    version = "1.0.1"
    subscription = "xxx-to provide-xxx"
    resource_group = "xxx-to provide-xxx"
    vnet_name = "xxx-to provide-xxx"
    subnet_name = "xxx-to provide-xxx"
}
```

## Get module result

```
result = "${module.get_ips.ip_availables}"
```
