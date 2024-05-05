
resource "azurerm_resource_group" "rgsvc123" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_app_service_plan" "appsvc123" {
  name                = "example-appservice-plantest"
  location            = azurerm_resource_group.rgsvc123.location
  resource_group_name = azurerm_resource_group.rgsvc123.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "svc123" {
  name                = "example-appservice"
  location            = azurerm_resource_group.rgsvc123.location
  resource_group_name = azurerm_resource_group.rgsvc123.name
  app_service_plan_id = azurerm_app_service_plan.appsvc123.id
}

output "app_service_url" {
  value       = azurerm_app_service.svc123.default_site_hostname
  description = "The default hostname of the app service."
}
