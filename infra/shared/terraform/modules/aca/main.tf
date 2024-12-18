terraform {
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "1.2.26"
    }
  }
}

# Container Apps environment naming convention using azurecaf_name module.
resource "azurecaf_name" "container_app_environment_name" {
  name          = var.application_name
  resource_type = "azurerm_container_app_environment"
  suffixes      = [var.location, var.environment]
}

# Create Azure Container Apps Environment in Dev

resource "azurerm_container_app_environment" "container_app_environment_dev" {
  count                      = var.environment == "dev" ? 1 : 0
  name                        = azurecaf_name.container_app_environment_name.result
  location                   = var.location
  resource_group_name        = var.resource_group
  log_analytics_workspace_id = var.log_analytics_workspace_id

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}

# Create Azure Container Apps Environment in Prod

resource "azurerm_container_app_environment" "container_app_environment_prod" {
  count                      = var.environment == "prod" ? 1 : 0
  name                        = azurecaf_name.container_app_environment_name.result
  location                   = var.location
  resource_group_name        = var.resource_group
  log_analytics_workspace_id = var.log_analytics_workspace_id
  zone_redundancy_enabled    = true

  internal_load_balancer_enabled = true
  infrastructure_subnet_id       = var.infrastructure_subnet_id

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}
