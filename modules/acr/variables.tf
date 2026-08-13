variable "acr_name" {
  description = "Name of the Azure Container Registry."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9]{5,50}$", var.acr_name))
    error_message = "ACR name must contain only alphanumeric characters and must be between 5 and 50 characters."
  }
}

variable "resource_group_name" {
  description = "Resource group where the Azure Container Registry will be created."
  type        = string
}

variable "location" {
  description = "Azure region where the ACR will be deployed."
  type        = string
}

variable "sku" {
  description = "Azure Container Registry SKU."
  type        = string
  default     = "Premium"

  validation {
    condition = contains(
      ["Basic", "Standard", "Premium"],
      var.sku
    )
    error_message = "sku must be Basic, Standard or Premium."
  }
}

variable "public_network_access_enabled" {
  description = "Whether public network access is permitted for the registry."
  type        = bool
  default     = false
}

variable "azure_services_bypass_allowed" {
  description = "Allow trusted Azure services to bypass ACR network restrictions."
  type        = bool
  default     = false
}

variable "allowed_cidrs" {
  description = "CIDR ranges permitted through the ACR firewall when required."
  type        = list(string)
  default     = []
}

variable "georeplication_locations" {
  description = "ACR geo-replication configuration. Premium SKU only."
  type        = any
  default     = []
}

variable "data_endpoint_enabled" {
  description = "Enable dedicated data endpoints. Premium SKU only."
  type        = bool
  default     = false
}

variable "zone_redundancy_enabled" {
  description = "Enable availability-zone redundancy for the registry. Premium SKU required."
  type        = bool
  default     = true
}

variable "identity_type" {
  description = "Managed identity type used by ACR."
  type        = string
  default     = "UserAssigned"
}

variable "identity_ids" {
  description = "Resource IDs of user-assigned managed identities attached to ACR."
  type        = list(string)
}

variable "identity_client_id" {
  description = "Client ID of the user-assigned managed identity used for ACR encryption."
  type        = string
}

variable "key_vault_key_id" {
  description = "Key Vault key resource ID used for ACR customer-managed encryption."
  type        = string
}

variable "admin_enabled" {
  description = "Whether ACR local admin credentials are enabled."
  type        = bool
  default     = false
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous image pull is enabled."
  type        = bool
  default     = false
}

variable "export_policy_enabled" {
  description = "Whether export policy is enabled."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the ACR."
  type        = map(string)
  default     = {}
}