#Call module

```
module "module_get_ip" {
    source = "https://github.com/ados1991/Get-AzureIpAvailablesAddressesSubnet.git"
    # Les 4 variables qui suivent sont requises pour l'execution du module
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