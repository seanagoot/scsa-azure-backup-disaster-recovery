#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
VM_NAME="vm-scsa-app01"

# Set retention date to 7 days from today
RETAIN_UNTIL=$(date -d "+7 days" +"%d-%m-%Y")

az backup protection backup-now \
  --resource-group "$RESOURCE_GROUP" \
  --vault-name "$VAULT_NAME" \
  --container-name "$VM_NAME" \
  --item-name "$VM_NAME" \
  --backup-management-type AzureIaasVM \
  --retain-until "$RETAIN_UNTIL"
