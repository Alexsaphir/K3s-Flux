resource "prowlarr_application_sonarr" "sonarr" {
  api_key  = var.sonarr-api-key
  base_url = "http://sonarr${var.is4k ? "4k" : ""}.media.svc.cluster.local:80"
  name     = "Sonarr${var.is4k ? " - 4k" : ""}"

  prowlarr_url = var.prowlarr-url
  sync_level   = "fullSync"

  sync_categories       = [5000, 5010, 5020, 5030, 5040, 5045, 5050, 5090]
  anime_sync_categories = [5070]
}

resource "prowlarr_application_radarr" "radarr" {
  api_key  = var.radarr-api-key
  base_url = "http://radarr${var.is4k ? "4k" : ""}.media.svc.cluster.local:80"
  name     = "Radarr${var.is4k ? " - 4k" : ""}"

  prowlarr_url = var.prowlarr-url
  sync_level   = "fullSync"

  sync_categories = [2000, 2010, 2020, 2030, 2040, 2045, 2050, 2060, 2070, 2080, 2090]
}
