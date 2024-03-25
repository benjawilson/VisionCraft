provider "azurerm" {                                                            
  features {}                                                                   
}                                                                               
                                                                                
# Create an Azure Resource Group                                                
resource "azurerm_resource_group" "rg" {                                        
  name     = var.resource_group_name                                            
  location = var.location                                                       
}  

# Create an app service plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = var.app_service_name 
  resource_group_name = azurerm_resource_group.rg.name 
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

# Create a linux web app
  resource "azurerm_linux_web_app" "webapp" {
  name                = var.web_app_name 
  resource_group_name = var.resource_group_name 
  location            = var.location 
  service_plan_id     = azurerm_service_plan.appserviceplan.id
  https_only          = true

  site_config {}
}
