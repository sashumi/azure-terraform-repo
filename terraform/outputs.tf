output "resource_group_ids" {
  description = "Resource Group IDs."
  value       = module.resource_groups.resource_group_ids
}


output "resource_group_names" {
  description = "Resource Group names."
  value       = module.resource_groups.resource_group_names
}


output "resource_groups" {
  description = "Complete Resource Group details."
  value       = module.resource_groups.resource_groups
}