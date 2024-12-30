#!/usr/bin/env bash

# https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-driver
az keyvault create --name $KEY_VAULT_NAME --resource-group $RESOURCE_GROUP --location $REGION --enable-rbac-authorization
