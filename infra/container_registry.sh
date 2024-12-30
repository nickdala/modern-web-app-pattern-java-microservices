#!/usr/bin/env bash

# Create the container registry.
az acr create --resource-group $RESOURCE_GROUP --name $CONTAINER_REGISTRY_NAME --sku Basic

az acr login -n $CONTAINER_REGISTRY_NAME
