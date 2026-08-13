output "resource_group_ids" {
  description = "Map of Resource Group IDs."

  value = {
    for key, rg in azurerm_resource_group.this :
    key => rg.id
  }
}


output "resource_group_names" {
  description = "Map of Resource Group names."

  value = {
    for key, rg in azurerm_resource_group.this :
    key => rg.name
  }
}


output "resource_group_locations" {
  description = "Map of Resource Group locations."

  value = {
    for key, rg in azurerm_resource_group.this :
    key => rg.location
  }
}


output "resource_groups" {
  description = "Complete Resource Group information."

  value = {
    for key, rg in azurerm_resource_group.this :
    key => {
      id       = rg.id
      name     = rg.name
      location = rg.location
    }
  }
}