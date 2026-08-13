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

variable "location" {
  description = "Azure deployment region."
  type        = string
}

variable "acr_name" {
  description = "Name of the Azure Container Registry."
  type        = string
}

variable "acr_resource_group_name" {
  description = "Resource group containing the ACR."
  type        = string
}

variable "acr_sku" {
  description = "Azure Container Registry SKU."
  type        = string
  default     = "Premium"
}

variable "acr_public_network_access_enabled" {
  description = "Whether the ACR permits public network access."
  type        = bool
  default     = false
}

variable "acr_azure_services_bypass_allowed" {
  description = "Whether trusted Azure services may bypass registry firewall rules."
  type        = bool
  default     = false
}

variable "acr_allowed_cidrs" {
  description = "CIDRs allowed through the registry firewall."
  type        = list(string)
  default     = []
}

variable "acr_georeplication_locations" {
  description = "Additional ACR geo-replication locations."
  type        = any
  default     = []
}

variable "acr_data_endpoint_enabled" {
  description = "Enable dedicated ACR data endpoints."
  type        = bool
  default     = false
}

variable "acr_zone_redundancy_enabled" {
  description = "Enable zone redundancy."
  type        = bool
  default     = true
}

variable "acr_identity_type" {
  description = "Managed identity type attached to ACR."
  type        = string
  default     = "UserAssigned"
}

variable "acr_identity_ids" {
  description = "User-assigned managed identity resource IDs."
  type        = list(string)
  default     = []
}

variable "acr_identity_client_id" {
  description = "Managed identity client ID used for ACR CMK."
  type        = string
  default     = null
}

variable "acr_key_vault_key_id" {
  description = "Key Vault key ID used for customer-managed encryption."
  type        = string
  default     = null
}

variable "acr_admin_enabled" {
  description = "Enable local ACR admin credentials."
  type        = bool
  default     = false
}

variable "acr_anonymous_pull_enabled" {
  description = "Allow anonymous image pull."
  type        = bool
  default     = false
}

variable "acr_export_policy_enabled" {
  description = "Enable registry export policy."
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "Common tags applied to Azure resources."
  type        = map(string)
  default     = {}
}

output "acr_id" {
  description = "Resource ID of the Azure Container Registry."
  value       = module.acr.acr_id
}

output "acr_name" {
  description = "Azure Container Registry name."
  value       = module.acr.name
}

output "acr_login_server" {
  description = "Azure Container Registry login server."
  value       = module.acr.login_server
}