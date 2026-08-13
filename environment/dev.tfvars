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