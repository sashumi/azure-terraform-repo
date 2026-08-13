location    = "uksouth"
environment = "dev"


common_tags = {
  environment = "dev"
  managed_by  = "terraform"
  project     = "dpn"
  application = "dpn"
}


resource_groups = {

  network = {
    name = "rg-dpn-network-dev"

    tags = {
      workload = "network"
      purpose  = "shared-networking"
    }
  }


  platform = {
    name = "rg-dpn-platform-dev"

    tags = {
      workload = "platform"
      purpose  = "aks-acr-platform"
    }
  }


  security = {
    name = "rg-dpn-security-dev"

    tags = {
      workload = "security"
      purpose  = "key-vault-security"
    }
  }


  observability = {
    name = "rg-dpn-observability-dev"

    tags = {
      workload = "observability"
      purpose  = "monitoring-logging"
    }
  }


  app = {
    name = "rg-dpn-app-dev"

    tags = {
      workload = "application"
      purpose  = "application-services"
    }
  }


  data = {
    name = "rg-dpn-data-dev"

    tags = {
      workload = "data"
      purpose  = "storage-data"
    }
  }
}

location = "uksouth"

acr_name                = "acrnesodpdevuks01"
acr_resource_group_name = "rg-dpn-platform-dev"
acr_sku                 = "Premium"

# Network security
acr_public_network_access_enabled = false
acr_azure_services_bypass_allowed = false
acr_allowed_cidrs                 = []

# Premium features
acr_data_endpoint_enabled   = false
acr_zone_redundancy_enabled = true

# No geo-replication initially for DEV
acr_georeplication_locations = []

# Authentication / registry security
acr_admin_enabled          = false
acr_anonymous_pull_enabled = false
acr_export_policy_enabled  = false

acr_identity_type = "UserAssigned"

# Only use these in tfvars if they are pre-existing resources.
acr_identity_ids = [
  "/subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.ManagedIdentity/userAssignedIdentities/<identity-name>"
]

acr_identity_client_id = "<managed-identity-client-id>"

acr_key_vault_key_id = "/subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.KeyVault/vaults/<vault-name>/keys/<key-name>/<version>"

common_tags = {
  environment = "dev"
  application = "dpn"
  managed_by  = "terraform"
  workload    = "platform"
}