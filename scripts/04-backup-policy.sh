#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"
POLICY_NAME="policy-scsa-vm-daily"

# Export Azure's default VM backup policy
az backup policy get-default-for-vm \
  --resource-group "$RESOURCE_GROUP" \
  --vault-name "$VAULT_NAME" \
  > policy-default.json

# Change daily retention to 7 days
jq '.properties.retentionPolicy.dailySchedule.retentionDuration.count = 7' \
  policy-default.json > policy-scsa-vm-daily.json

# Create the custom backup policy
az backup policy create \
  --resource-group "$RESOURCE_GROUP" \
  --vault-name "$VAULT_NAME" \
  --name "$POLICY_NAME" \
  --backup-management-type AzureIaasVM \
  --policy @policy-scsa-vm-daily.json
