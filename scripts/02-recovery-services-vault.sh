#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
LOCATION="koreacentral"

az provider register \
  --namespace Microsoft.RecoveryServices

az backup vault create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$VAULT_NAME" \
  --location "$LOCATION"
