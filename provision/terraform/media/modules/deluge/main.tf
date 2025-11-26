terraform {
  required_version = ">= 1.0"
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "1.3.0"
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

data "sops_file" "config" {
  source_file = var.source_file
}

locals {
  host     = data.sops_file.config.data["host"]
  port     = data.sops_file.config.data["port"]
  password = data.sops_file.config.data["password"]
  url_base = data.sops_file.config.data["url_base"]
}

resource "prowlarr_download_client_deluge" "client" {
  category = "prowlarr"

  name          = var.name
  enable        = var.enable
  priority      = var.priority
  item_priority = var.item_priority
  add_paused    = true

  host     = local.host
  port     = local.port
  password = local.password
  url_base = local.url_base
  use_ssl  = var.use_ssl
}

resource "sonarr_download_client_deluge" "client" {

  name       = var.name
  enable     = var.enable
  priority   = var.priority
  add_paused = false

  tv_category = "tv-sonarr"

  host     = local.host
  port     = local.port
  password = local.password
  url_base = local.url_base
  use_ssl  = var.use_ssl
}

resource "radarr_download_client_deluge" "client" {

  name       = var.name
  enable     = var.enable
  priority   = var.priority
  add_paused = true

  movie_category = "movies"

  host     = local.host
  port     = local.port
  password = local.password
  url_base = local.url_base
  use_ssl  = var.use_ssl

  remove_completed_downloads = true
}
