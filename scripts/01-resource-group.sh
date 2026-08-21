#!/bin/bash

RESOURCE_GROUP="rg-scsa-backup-krc"
LOCATION="koreacentral"

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"
