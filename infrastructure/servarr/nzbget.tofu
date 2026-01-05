locals {
  nzbget_url = "nzbget.media.svc.cluster.local"
}

resource "prowlarr_download_client_nzbget" "prowlarr" {
  name = "NZBGet"

  host    = local.nzbget_url
  port    = 80
  use_ssl = false

  priority = 10
}

resource "sonarr_download_client_nzbget" "sonarr" {
  name = "NZBGet"

  host    = local.nzbget_url
  port    = 80
  use_ssl = false

  tv_category = "Series"
  priority    = 1
}

resource "sonarr_download_client_nzbget" "sonarr4k" {
  name = "NZBGet"

  host     = local.nzbget_url
  port     = 80
  use_ssl  = false
  provider = sonarr.sonarr4k

  tv_category = "Series-4k"
  priority    = 1
}


resource "radarr_download_client_nzbget" "radarr" {
  name = "NZBGet"

  host    = local.nzbget_url
  port    = 80
  use_ssl = false

  movie_category = "Movies"
  priority       = 1
}

resource "radarr_download_client_nzbget" "radarr4k" {
  name = "NZBGet"

  host     = local.nzbget_url
  port     = 80
  use_ssl  = false
  provider = radarr.radarr4k

  movie_category = "Movies-4k"
  priority       = 1
}


import {
  id = "1"
  to = sonarr_download_client_nzbget.sonarr
}
import {
  id = "1"
  to = sonarr_download_client_nzbget.sonarr4k
}
import {
  id = "1"
  to = radarr_download_client_nzbget.radarr
}
import {
  id = "1"
  to = radarr_download_client_nzbget.radarr4k
}
