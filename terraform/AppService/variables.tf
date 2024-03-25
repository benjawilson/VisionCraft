variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  default     = "West US"
}

variable "app_service_name" {
  description = "The name of the app service plan"
}

variable "web_app_name" {
  description = "The name of the web app"
}
