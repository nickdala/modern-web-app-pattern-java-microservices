#!/usr/bin/env bash

echo "Creating the AKS cluster..."

az aks create --resource-group $RESOURCE_GROUP \
--name $AKS_CLUSTER_NAME \
--node-count $AKS_NODE_COUNT \
--node-vm-size $AKS_NODE_SIZE \
--kubernetes-version $AKS_CLUSTER_VERSION \
--generate-ssh-keys \
--enable-blob-driver \
--enable-addons azure-keyvault-secrets-provider \
--tier free \
--tags $TAG

aks update --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME --enable-disk-driver --enable-file-driver

az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME

echo "AKS cluster created successfully."
