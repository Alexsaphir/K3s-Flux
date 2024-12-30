provider "prowlarr" {
  url     = "https://prowlarr.${var.domain_name}"
  api_key = module.api.keys["prowlarr"]
}

provider "radarr" {
  url     = "https://radarr.${var.domain_name}"
  api_key = module.api.keys["radarr"]
}

provider "sonarr" {
  url     = "https://sonarr.${var.domain_name}"
  api_key = module.api.keys["sonarr"]
}

provider "lidarr" {
  url     = "https://lidarr.${var.domain_name}"
  api_key = module.api.keys["lidarr"]
}

provider "readarr" {
  url     = "https://readarr.${var.domain_name}"
  api_key = module.api.keys["readarr"]
}
