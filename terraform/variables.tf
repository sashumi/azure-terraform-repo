variable "location" {
  description = "Primary Azure deployment region."
  type        = string
}


variable "environment" {
  description = "Deployment environment, for example dev, test or prod."
  type        = string

  validation {
    condition = contains(
      ["dev", "test", "prod"],
      lower(var.environment)
    )

    error_message = "environment must be dev, test or prod."
  }
}


variable "resource_groups" {
  description = "Resource Groups required by the DPN platform."

  type = map(object({
    name     = string
    location = optional(string)
    tags     = optional(map(string), {})
  }))
}


variable "common_tags" {
  description = "Common tags assigned to all resources."
  type        = map(string)
  default     = {}
}