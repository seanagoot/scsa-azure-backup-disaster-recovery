#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"

az backup vault backup-properties set \
  --name "$VAULT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --backup-storage-redundancy LocallyRedundant
