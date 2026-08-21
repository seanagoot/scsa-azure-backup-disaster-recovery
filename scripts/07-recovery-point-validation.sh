#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
VM_NAME="vm-scsa-app01"

az backup recoverypoint list \
  --resource-group "$RESOURCE_GROUP" \
  --vault-name "$VAULT_NAME" \
  --container-name "$VM_NAME" \
  --item-name "$VM_NAME" \
  --backup-management-type AzureIaasVM \
  --query "[].{RecoveryPointTime:properties.recoveryPointTime,Type:properties.recoveryPointType}" \
  --output table
