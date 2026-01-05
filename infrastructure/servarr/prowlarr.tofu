locals {
  prowlarr_url = "http://prowlarr.media.svc.cluster.local:80"

  sonarr_apps = {
    sonarr = {
      base_url  = "http://sonarr.media.svc.cluster.local:80"
      api_key   = yamldecode(data.bitwarden-secrets_secret.sonarr.value).SONARR_API_KEY
      long_name = "Sonarr"
    }

    sonarr4k = {
      base_url  = "http://sonarr4k.media.svc.cluster.local:80"
      api_key   = yamldecode(data.bitwarden-secrets_secret.sonarr.value).SONARR4K_API_KEY
      long_name = "Sonarr - 4k"
    }
  }
  radarr_apps = {
    radarr = {
      base_url  = "http://radarr.media.svc.cluster.local:80"
      api_key   = yamldecode(data.bitwarden-secrets_secret.radarr.value).RADARR_API_KEY
      long_name = "Radarr"
    }

    radarr4k = {
      base_url  = "http://radarr4k.media.svc.cluster.local:80"
      api_key   = yamldecode(data.bitwarden-secrets_secret.radarr.value).RADARR4K_API_KEY
      long_name = "Radarr - 4k"
    }
  }
}

resource "prowlarr_application_sonarr" "sonarr" {
  for_each = local.sonarr_apps
  api_key  = each.value.api_key
  base_url = each.value.base_url
  name     = each.value.long_name

  prowlarr_url = local.prowlarr_url
  sync_level   = "fullSync"

  sync_categories       = [5000, 5010, 5020, 5030, 5040, 5045, 5050, 5090]
  anime_sync_categories = [5070]
}

resource "prowlarr_application_radarr" "radarr" {
  for_each = local.radarr_apps
  api_key  = each.value.api_key
  base_url = each.value.base_url
  name     = each.value.long_name

  prowlarr_url = local.prowlarr_url
  sync_level   = "fullSync"

  sync_categories = [2000, 2010, 2020, 2030, 2040, 2045, 2050, 2060, 2070, 2080, 2090]
}

# Sync Profiles
resource "prowlarr_sync_profile" "standard" {
  name                      = "Standard"
  enable_automatic_search   = true
  enable_interactive_search = true
  enable_rss                = true
  minimum_seeders           = 1
}


import {
  id = "1"
  to = prowlarr_application_sonarr.sonarr["sonarr"]
}
import {
  id = "2"
  to = prowlarr_application_sonarr.sonarr["sonarr4k"]
}
import {
  id = "3"
  to = prowlarr_application_radarr.radarr["radarr"]
}
import {
  id = "4"
  to = prowlarr_application_radarr.radarr["radarr4k"]
}
import {
  id = "1"
  to = prowlarr_sync_profile.standard
}
