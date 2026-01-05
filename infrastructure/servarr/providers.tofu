terraform {
  required_version = ">= 1.0"
  required_providers {
    bitwarden-secrets = {
      source  = "bitwarden/bitwarden-secrets"
      version = "0.5.4-pre"
    }
    prowlarr = {
      source  = "devopsarr/prowlarr"
      version = "3.1.0"
    }
    sonarr = {
      source  = "devopsarr/sonarr"
      version = "3.4.0"
    }
    radarr = {
      source  = "devopsarr/radarr"
      version = "2.3.3"
    }
  }
}

provider "bitwarden-secrets" {
  api_url         = "https://api.bitwarden.com"
  identity_url    = "https://identity.bitwarden.com"
  access_token    = var.access_token
  organization_id = var.organization_id
}


provider "prowlarr" {
  url     = "https://prowlarr.${var.domain_name}"
  api_key = yamldecode(data.bitwarden-secrets_secret.prowlarr.value).PROWLARR_API_KEY
}

provider "sonarr" {
  url     = "https://sonarr.${var.domain_name}"
  api_key = local.sonarr_apps.sonarr.api_key
}

provider "sonarr" {
  url     = "https://sonarr4k.${var.domain_name}"
  api_key = local.sonarr_apps.sonarr4k.api_key
  alias   = "sonarr4k"
}

provider "radarr" {
  url     = "https://radarr.${var.domain_name}"
  api_key = local.radarr_apps.radarr.api_key
}

provider "radarr" {
  url     = "https://radarr4k.${var.domain_name}"
  api_key = local.radarr_apps.radarr4k.api_key
  alias   = "radarr4k"
}
