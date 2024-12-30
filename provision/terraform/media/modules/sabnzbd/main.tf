terraform {
  required_version = ">= 1.0"
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "1.1.1"
    }
    prowlarr = {
      source  = "devopsarr/prowlarr"
      version = "2.4.3"
    }
    sonarr = {
      source  = "devopsarr/sonarr"
      version = "3.4.0"
    }
    radarr = {
      source  = "devopsarr/radarr"
      version = "2.3.1"
    }
  }
}

data "sops_file" "config" {
  source_file = var.source_file
}

locals {
  host    = data.sops_file.config.data["host"]
  port    = data.sops_file.config.data["port"]
  api_key = data.sops_file.config.data["api_key"]
}

resource "prowlarr_download_client_sabnzbd" "client" {
  category = "prowlarr"

  name          = var.name
  enable        = var.enable
  priority      = var.priority
  item_priority = var.item_priority

  host    = local.host
  port    = local.port
  api_key = local.api_key
  use_ssl = var.use_ssl
}

resource "sonarr_download_client_sabnzbd" "client" {
  name     = var.name
  enable   = var.enable
  priority = var.priority

  tv_category = "tv"

  host    = local.host
  port    = local.port
  api_key = local.api_key
  use_ssl = var.use_ssl

  remove_completed_downloads = false
  remove_failed_downloads    = true
}

resource "radarr_download_client_sabnzbd" "client" {
  name     = var.name
  enable   = var.enable
  priority = var.priority

  movie_category = "movies"

  host    = local.host
  port    = local.port
  api_key = local.api_key
  use_ssl = var.use_ssl

  remove_completed_downloads = false
  remove_failed_downloads    = true
}
