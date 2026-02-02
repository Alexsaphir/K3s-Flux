terraform {
  required_version = ">= 1.0"

  required_providers {
    prowlarr = {
      source  = "devopsarr/prowlarr"
      version = "3.2.0"
    }
    radarr = {
      source  = "devopsarr/radarr"
      version = "2.3.5"
    }
    sonarr = {
      source  = "devopsarr/sonarr"
      version = "3.4.1"
    }
    lidarr = {
      source  = "devopsarr/lidarr"
      version = "1.13.0"
    }
    readarr = {
      source  = "devopsarr/readarr"
      version = "2.1.0"
    }

    sops = {
      source  = "carlpett/sops"
      version = "1.3.0"
    }
  }
}

# This module allow to fetch the secret from kubernetes.
module "api" {
  source = "./modules/api_secrets"
}

provider "prowlarr" {
  url     = "https://prowlarr.${module.api.domain_name}"
  api_key = module.api.keys["prowlarr"]
}

provider "radarr" {
  url     = "https://radarr.${module.api.domain_name}"
  api_key = module.api.keys["radarr"]
}

provider "sonarr" {
  url     = "https://sonarr.${module.api.domain_name}"
  api_key = module.api.keys["sonarr"]
}

provider "lidarr" {
  url     = "https://lidarr.${module.api.domain_name}"
  api_key = module.api.keys["lidarr"]
}

provider "readarr" {
  url     = "https://readarr.${module.api.domain_name}"
  api_key = module.api.keys["readarr"]
}
