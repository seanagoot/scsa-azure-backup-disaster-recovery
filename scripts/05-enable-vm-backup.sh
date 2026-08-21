#!/bin/bash

BACKUP_RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
POLICY_NAME="policy-scsa-vm-daily"

VM_RESOURCE_GROUP="rg-scsa-compute-krc"
VM_NAME="vm-scsa-app01"

# Get the VM resource ID
VM_ID=$(az vm show \
  --resource-group "$VM_RESOURCE_GROUP" \
  --name "$VM_NAME" \
  --query id \
  --output tsv)

# Enable Azure Backup protection for the VM
az backup protection enable-for-vm \
  --resource-group "$BACKUP_RESOURCE_GROUP" \
  --vault-name "$VAULT_NAME" \
  --vm "$VM_ID" \
  --policy-name "$POLICY_NAME"
