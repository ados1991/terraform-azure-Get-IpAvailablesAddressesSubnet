#!/bin/bash

function error_exit() {
    echo "$1" 1>&2
    exit 1 
}


function check_deps() {
    test -f $(which jq) || error _exit "jq command not detected in path, please install it"
    test -f $(which az) || error _exit "az command not detected in path, please install it"
}

function parse_input() {
    #jq reads from stdin so we don't have to set up any inputs, but let's validate the outputs
    eval "$(jq -r '@sh "export SUBSCRIPTION=\(.subscription) RESOURCE_GROUP=\(.resource_group) VNET_NAME=\(.vnet_name) SUBNET_NAME=\(.subnet_name)"')"
    if [[ -z "${SUBSCRIPTION}" ]]; then export SUBSCRIPTION=none; fi 
    if [[ -z "${RESOURCE_GROUP}" ]]; then export RESOURCE_GROUP=none; fi
    if [[ -z "${VNET_NAME}" ]]; then export VNET_NAME=none; fi
    if [[ -z "${SUBNET_NAME}" ]]; then export SUBNET_NAME=none; fi 
}

function get_ips() {
    TF_DO_DATA_ip_resource_id=$(az network vnet subnet show --subscription $SUBSCRIPTION --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --name $SUBNET_NAME | jq  '.addressPrefix |= (sub("/[0-9]{1,2}"; ""))' | jq -r '[.addressPrefix, .id] | @tsv')
    [[ $TF_DO_DATA_ip_resource_id =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}   ]] && read TF_DO_DATA_ip TF_DO_DATA_resource_id <<< $(echo $TF_DO_DATA_ip_resource_id) || error_exit $TF_DO_DATA_ip_resource_id
    az network vnet check-ip-address --ids $TF_DO_DATA_resource_id --ip-address $TF_DO_DATA_ip | jq -r '{data: (.availableIpAddresses | join(","))}' && unset TF_DO_DATA_ip_resource_id TF_DO_DATA_resource_id TF_DO_DATA_ip
}

check_deps
parse_input
get_ips
