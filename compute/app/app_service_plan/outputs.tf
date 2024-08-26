output "ids" {
  value = values(azurerm_app_service_plan.app_service_plan)[*].id
}
