module "acr" {
  source = "git::https://dev.azure.com/NationalEnergySO/ProductCatalog/_git/elem-az-tf-ACR?ref=<APPROVED_VERSION>"

  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  # Network configuration
  public_network_access_enabled = var.public_network_access_enabled
  azure_services_bypass_allowed = var.azure_services_bypass_allowed
  allowed_cidrs                 = var.allowed_cidrs

  # Premium capabilities
  georeplication_locations = var.georeplication_locations
  data_endpoint_enabled    = var.data_endpoint_enabled
  zone_redundancy_enabled  = var.zone_redundancy_enabled

  # Registry configuration
  admin_enabled          = var.admin_enabled
  anonymous_pull_enabled = var.anonymous_pull_enabled
  export_policy_enabled  = var.export_policy_enabled

  # Managed identity / CMK
  identity_type      = var.identity_type
  identity_ids       = var.identity_ids
  identity_client_id = var.identity_client_id
  key_vault_key_id   = var.key_vault_key_id

  tags = var.tags
}