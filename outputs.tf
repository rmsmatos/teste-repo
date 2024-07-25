output "id" {
  value       = resource.azurerm_resource_group.resourcegroup.id
  description = "Returns Resource Group ID."
}

output "location" {
  value       = resource.azurerm_resource_group.resourcegroup.location
  description = "Returns Resource Group Location."
}

output "name" {
  value       = resource.azurerm_resource_group.resourcegroup.name
  description = "Returns Resource Group Name."
}

output "managed_by" {
  value       = resource.azurerm_resource_group.resourcegroup.managed_by
  description = "Returns the ID of the resource or application that manages this Resource Group."
}

output "tags" {
  value       = resource.azurerm_resource_group.resourcegroup.tags
  description = "Returns Resource Group Tags."
}
