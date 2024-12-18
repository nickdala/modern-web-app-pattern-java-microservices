output "identity_principal_id" {
  value = azurerm_container_app.container_app.identity[0].principal_id
}

output "default_domain" {
  value = length(azurerm_container_app_environment.container_app_environment_prod) > 0 ? azurerm_container_app_environment.container_app_environment_prod[0].default_domain : ""
}

output "static_ip_address" {
  value = length(azurerm_container_app_environment.container_app_environment_prod) > 0 ? azurerm_container_app_environment.container_app_environment_prod[0].static_ip_address : ""
}

output "support_guide_identity_principal_id" {
  value = azurerm_container_app.container_app_support_guide.identity[0].principal_id
}

output "support_guide_url" {
  value = azurerm_container_app.container_app_support_guide.ingress[0].fqdn
}
