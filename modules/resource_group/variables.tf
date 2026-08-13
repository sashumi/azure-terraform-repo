variable "default_location" {
  description = "Default Azure region used when a resource group does not explicitly define a location."
  type        = string

  validation {
    condition = length(trimspace(var.default_location)) > 0
    error_message = "default_location must not be empty."
  }
}


variable "resource_groups" {
  description = "Map of Azure Resource Groups to create."

  type = map(object({
    name     = string
    location = optional(string)
    tags     = optional(map(string), {})
  }))

  validation {
    condition = alltrue([
      for rg in values(var.resource_groups) :
      length(trimspace(rg.name)) > 0
    ])

    error_message = "Every resource group must have a valid name."
  }
}


variable "common_tags" {
  description = "Common tags applied to all resource groups."
  type        = map(string)
  default     = {}
}