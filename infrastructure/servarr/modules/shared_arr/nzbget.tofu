resource "prowlarr_download_client_nzbget" "prowlarr" {
  count = var.is4k ? 0 : 1

  name   = "NZBGet"
  enable = true

  host    = var.nzbget-url
  port    = 80
  use_ssl = false

  category = "Prowlarr"

  priority = 1
}

resource "sonarr_download_client_nzbget" "sonarr" {
  name   = "NZBGet"
  enable = true

  host    = var.nzbget-url
  port    = 80
  use_ssl = false

  tv_category = "Series${var.is4k ? "-4k" : ""}"
  priority    = 1
}

resource "radarr_download_client_nzbget" "radarr" {
  name   = "NZBGet"
  enable = true

  host    = var.nzbget-url
  port    = 80
  use_ssl = false

  movie_category = "Movies${var.is4k ? "-4k" : ""}"
  priority       = 1
}
