#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
VAULT_NAME="rsv-scsa-backup-krc"

az backup item list \
  --resource-group "$RESOURCE_GROUP" \
  --vault-name "$VAULT_NAME" \
  --backup-management-type AzureIaasVM \
  --query "[].{VM:properties.friendlyName,ProtectionState:properties.protectionState,HealthStatus:properties.healthStatus,Policy:properties.policyName}" \
  --output table
