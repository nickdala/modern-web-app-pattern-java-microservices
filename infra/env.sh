#!/usr/bin/env bash
##############################################################################
# Usage: source env.sh
# Set all environment variables needed for the project.
##############################################################################

echo "Setting environment variables..."
echo "------------------------------"
#export UNIQUE_IDENTIFIER=$(openssl rand -hex 3) # Some resources need a unique identifier
export UNIQUE_IDENTIFIER=1dfd94
export SUBSCRIPTION_ID=$(az account show --query id --output tsv)

export PROJECT="camsk8s$UNIQUE_IDENTIFIER"
export REGION="eastus"                      # Replace with your desired region
export RESOURCE_GROUP="rg-$PROJECT"
export TAG="camsk8s"

# Project
export PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"

# Key Vault
export KEY_VAULT_NAME="kv-$PROJECT"

# Container Registry
export CONTAINER_REGISTRY_NAME="cr$PROJECT"

# AKS
export AKS_CLUSTER_NAME="aks-$PROJECT"
export AKS_CLUSTER_VERSION="1.30.6"
export AKS_NODE_COUNT=3
export AKS_NODE_SIZE="Standard_B2s"
export AKS_NODE_POOL_NAME="nodepool"

echo "Environment variables set successfully."
echo "---------------------------------------"
echo "PROJECT: $PROJECT"
echo "REGION: $REGION"
echo "RESOURCE_GROUP: $RESOURCE_GROUP"
echo "TAG: $TAG"
echo "---------------------------------------"
echo "AKS_CLUSTER_NAME: $AKS_CLUSTER_NAME"
echo "AKS_CLUSTER_VERSION: $AKS_CLUSTER_VERSION"
echo "AKS_NODE_COUNT: $AKS_NODE_COUNT"
echo "AKS_NODE_SIZE: $AKS_NODE_SIZE"
echo "AKS_NODE_POOL_NAME: $AKS_NODE_POOL_NAME"
echo "---------------------------------------"
echo "CONTAINER_REGISTRY_NAME: $CONTAINER_REGISTRY_NAME"
echo "---------------------------------------"
echo "KEY_VAULT_NAME: $KEY_VAULT_NAME"
echo "---------------------------------------"
echo "Project root: $PROJECT_ROOT"
echo "---------------------------------------"
echo "Environment variables set successfully."
echo "---------------------------------------"

echo "Updating Azure CLI extensions..."
az extension add --upgrade --name k8s-extension
