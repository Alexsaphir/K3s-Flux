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
  }
}

data "sops_file" "config" {
  source_file = var.source_file
}

locals {
  host     = data.sops_file.config.data["host"]
  port     = data.sops_file.config.data["port"]
  username = data.sops_file.config.data["username"]
  password = data.sops_file.config.data["password"]
  api_key  = data.sops_file.config.data["api_key"]
}

resource "prowlarr_download_client_sabnzbd" "client" {
  category = "prowlarr"

  name          = var.name
  enable        = var.enable
  priority      = var.priority
  item_priority = var.item_priority

  host     = local.host
  port     = local.port
  api_key  = local.api_key
  username = local.username
  password = local.password
  use_ssl  = var.use_ssl
}
