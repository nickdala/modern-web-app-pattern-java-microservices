variable "resource_group" {
  type        = string
  description = "The resource group"
}

variable "application_name" {
  type        = string
  description = "The name of your application"
}

variable "environment" {
  type        = string
  description = "The environment (dev, test, prod...)"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "The Azure region where all resources in this example should be created"
}

variable "appsvc_subnet_id" {
  type        = string
  description = "The subnet id where the app service will be integrated"
}

variable "private_dns_resource_group" {
  type        = string
  description = "The resource group where the private dns zone is created"
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "The resourceId for a subnet in an Azure vnet that will be used for private endpoints"
}

variable "frontdoor_host_name" {
  type        = string
  description = "The front door host name"
}

variable "frontdoor_profile_uuid" {
  type        = string
  description = "The UUID of this Front Door Profile which will be sent in the HTTP Header as the X-Azure-FDID attribute.."
}

variable "app_insights_connection_string" {
  type        = string
  description = "The app insights connection string"
}

variable "app_insights_instrumentation_key" {
  type       = string
  description = "The app insights instrumentation key"
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The id of the log analytics workspace"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Should public network access be enabled for the Web App."
}

variable "app_config_endpoint" {
  type = string
  description = "The Azure App Configuration URI."

}

variable "service_management_reference" {
  type = string
  description = "value for the service management reference"
  default = null
}

variable "support_guide_url" {
  type = string
  description = "The URL for the support guide"
}
