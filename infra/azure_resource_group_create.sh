#!/usr/bin/env bash

echo "Creating the resource group..."
echo "------------------------------"
az group create \
  --name "$RESOURCE_GROUP" \
  --location "$REGION" \
  --tags system="$TAG"
