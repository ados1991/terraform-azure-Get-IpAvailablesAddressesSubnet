#Call module

```
module "module_get_ip" {
    source = "https://github.com/ados1991/Get-AzureIpAvailablesAddressesSubnet.git"
    subscription = "xxx-to provide-xxx"
    resource_group = "xxx-to provide-xxx"
    vnet_name = "xxx-to provide-xxx"
    subnet_name = "xxx-to provide-xxx"
}
```

#Get module result

```
result = "${module.Get-AzureIpAvailablesAddressesSubnet.ip_availables}"
```
