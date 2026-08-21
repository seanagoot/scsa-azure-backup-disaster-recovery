#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
VM_NAME="vm-scsa-app01"

# Trigger an on-demand backup.
# Update RETAIN_UNTIL before running if needed.
RETAIN_UNTIL="28-08-2026"

az backup protection backup-now \
  --resource-group "$RESOURCE_GROUP" \
  --vault-name "$VAULT_NAME" \
  --container-name "$VM_NAME" \
  --item-name "$VM_NAME" \
  --backup-management-type AzureIaasVM \
  --retain-until "$RETAIN_UNTIL"
