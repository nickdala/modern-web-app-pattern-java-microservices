
# Create Azure Container App in the specified environment

resource "azurerm_container_app" "container_app_support_guide" {
  name                         = "support-guide"
  container_app_environment_id = var.environment == "dev" ? azurerm_container_app_environment.container_app_environment_dev[0].id : azurerm_container_app_environment.container_app_environment_prod[0].id
  resource_group_name          = var.resource_group
  revision_mode                = "Single"
  workload_profile_name        = "Consumption"

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 9090
    transport                  = "http2"
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  tags = {
    "environment"      = var.environment
    "application-name" = var.application_name
    "azd-service-name" = "support-guide"
  }

  lifecycle {
    ignore_changes = [
      template.0.container["image"]
    ]
  }

  identity {
    type = "SystemAssigned, UserAssigned"
    identity_ids = [
      var.container_registry_user_assigned_identity_id
    ]
  }

  registry {
    server   = var.acr_login_server
    identity = var.container_registry_user_assigned_identity_id
  }

  secret {
    name  = "azure-servicebus-connection-string"
    value = var.servicebus_namespace_primary_connection_string
  }

  template {
    container {
      name = "support-guide-app"

      // A container image is required to deploy the ACA resource.
      // Since the rendering service image is not available yet,
      // we use a placeholder image for now.
      image  = "mcr.microsoft.com/cbl-mariner/busybox:2.0"
      cpu    = 1.0
      memory = "2.0Gi"

      env {
        name = "APPLICATIONINSIGHTS_CONNECTION_STRING"
        value = var.app_insights_connection_string
      }
    }
    max_replicas = 10
    min_replicas = 1

  }
}
