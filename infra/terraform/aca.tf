
# ----------------------------------------------------------------------------------------------
#  Azure Container Apps - Prod - Primary Region
# ----------------------------------------------------------------------------------------------


module "aca" {
  count                                          = var.environment == "prod" ? 1 : 0
  source                                         = "../shared/terraform/modules/aca"
  resource_group                                 = azurerm_resource_group.spoke[0].name
  application_name                               = var.application_name
  environment                                    = var.environment
  location                                       = var.location
  email_request_queue_name                       = module.servicebus[0].queue_email_request_name
  email_response_queue_name                      = module.servicebus[0].queue_email_response_name
  servicebus_namespace                           = module.servicebus[0].namespace_name
  container_registry_user_assigned_identity_id   = module.acr[0].container_registry_user_assigned_identity_id
  acr_login_server                               = module.acr[0].acr_login_server
  app_insights_connection_string                 = module.hub_app_insights[0].connection_string
  log_analytics_workspace_id                     = module.hub_app_insights[0].log_analytics_workspace_id
  servicebus_namespace_primary_connection_string = module.servicebus[0].servicebus_namespace_primary_connection_string
  infrastructure_subnet_id                       = module.spoke_vnet[0].subnets[local.aca_subnet_name].id
}



# ----------------------------------------------------------------------------------------------
#  Secondary Azure Container Apps - Prod - Secondary Region
# ----------------------------------------------------------------------------------------------
module "secondary_aca" {
  count                                          = var.environment == "prod" ? 1 : 0
  source                                         = "../shared/terraform/modules/aca"
  resource_group                                 = azurerm_resource_group.secondary_spoke[0].name
  application_name                               = var.application_name
  environment                                    = var.environment
  location                                       = var.secondary_location
  email_request_queue_name                       = module.secondary_servicebus[0].queue_email_request_name
  email_response_queue_name                      = module.secondary_servicebus[0].queue_email_response_name
  servicebus_namespace                           = module.secondary_servicebus[0].namespace_name
  container_registry_user_assigned_identity_id   = module.acr[0].container_registry_user_assigned_identity_id
  acr_login_server                               = module.acr[0].acr_login_server
  log_analytics_workspace_id                     = module.hub_app_insights[0].log_analytics_workspace_id
  app_insights_connection_string                 = module.hub_app_insights[0].connection_string
  servicebus_namespace_primary_connection_string = module.secondary_servicebus[0].servicebus_namespace_primary_connection_string
  infrastructure_subnet_id                       = module.secondary_spoke_vnet[0].subnets[local.aca_subnet_name].id
}


# ----------------------------------------------------------------------------------------------
# Azure Container Apps - Dev
# ----------------------------------------------------------------------------------------------

module "dev_aca" {
  count                                          = var.environment == "dev" ? 1 : 0
  source                                         = "../shared/terraform/modules/aca"
  resource_group                                 = azurerm_resource_group.dev[0].name
  application_name                               = var.application_name
  environment                                    = var.environment
  location                                       = var.location
  email_request_queue_name                       = module.dev_servicebus[0].queue_email_request_name
  email_response_queue_name                      = module.dev_servicebus[0].queue_email_response_name
  servicebus_namespace                           = module.dev_servicebus[0].namespace_name
  container_registry_user_assigned_identity_id   = module.dev_acr[0].container_registry_user_assigned_identity_id
  acr_login_server                               = module.dev_acr[0].acr_login_server
  log_analytics_workspace_id                     = module.dev_app_insights[0].log_analytics_workspace_id
  app_insights_connection_string                 = module.dev_app_insights[0].connection_string
  servicebus_namespace_primary_connection_string = module.dev_servicebus[0].servicebus_namespace_primary_connection_string
}

resource "azurerm_role_assignment" "storage_container_support_guide_data_contributor_dev" {
  count                = var.environment == "dev" ? 1 : 0
  scope                = module.dev_storage[0].storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.dev_aca.0.support_guide_identity_principal_id //azurerm_container_app.support-guide-container_app.identity.0.principal_id
}
