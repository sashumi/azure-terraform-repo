output "acr_id" {
  description = "Resource ID of the Azure Container Registry."
  value       = module.acr.acr_id
}

output "name" {
  description = "Name of the Azure Container Registry."
  value       = module.acr.name
}

output "login_server" {
  description = "Login server URL of the Azure Container Registry."
  value       = module.acr.login_server
}

output "resource" {
  description = "Complete Azure Container Registry resource."
  value       = module.acr.resource
}