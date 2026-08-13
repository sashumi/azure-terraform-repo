module "resource_groups" {
  source = "./modules/resource_group"

  default_location = var.location
  resource_groups  = var.resource_groups
  common_tags      = var.common_tags
}

module "acr" {
  source = "./modules/acr"

  acr_name            = var.acr_name
  resource_group_name = var.acr_resource_group_name
  location            = var.location
  sku                 = var.acr_sku

  identity_type      = "UserAssigned"
  identity_ids       = [module.acr_identity.id]
  identity_client_id = module.acr_identity.client_id
  key_vault_key_id   = module.key_vault_key.key_id

  public_network_access_enabled = false
  azure_services_bypass_allowed = false
  allowed_cidrs                 = []

  georeplication_locations = var.acr_georeplication_locations
  data_endpoint_enabled    = var.acr_data_endpoint_enabled
  zone_redundancy_enabled  = var.acr_zone_redundancy_enabled

  admin_enabled          = false
  anonymous_pull_enabled = false
  export_policy_enabled  = false

  tags = merge(
    var.common_tags,
    {
      workload = "acr"
    }
  )
}