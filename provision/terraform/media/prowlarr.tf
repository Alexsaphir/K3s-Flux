variable "default-sync_level" {
  default = "fullSync"
  type    = string
  validation {
    condition     = contains(["addOnly", "fullSync", "disabled"], var.default-sync_level)
    error_message = "The sync_level must be one of the following values: 'addOnly', 'fullSync', or 'disabled'."
  }
}

locals {
  prowlarr_url = "http://prowlarr:${module.api.ports["prowlarr"]}"
}

# Applications
resource "prowlarr_application_sonarr" "sonarr" {
  name                  = "Sonarr"
  base_url              = "http://sonarr:${module.api.ports["sonarr"]}"
  prowlarr_url          = local.prowlarr_url
  api_key               = module.api.keys["sonarr"]
  sync_level            = var.default-sync_level
  sync_categories       = [5000, 5010, 5020, 5030, 5040, 5045, 5050, 5070]
  anime_sync_categories = [5070]
}

resource "prowlarr_application_radarr" "radarr" {
  name            = "Radarr"
  base_url        = "http://radarr:${module.api.ports["radarr"]}"
  prowlarr_url    = local.prowlarr_url
  api_key         = module.api.keys["radarr"]
  sync_level      = var.default-sync_level
  sync_categories = [2000, 2010, 2020, 2030, 2040, 2045, 2050, 2060, 2070, 2080]
}

resource "prowlarr_application_readarr" "readarr" {
  name            = "Readarr"
  base_url        = "http://readarr:${module.api.ports["readarr"]}"
  prowlarr_url    = local.prowlarr_url
  api_key         = module.api.keys["readarr"]
  sync_level      = var.default-sync_level
  sync_categories = [3030, 7000, 7010, 7020, 7030, 7040, 7050, 7060]
}

resource "prowlarr_application_lidarr" "lidarr" {
  name            = "Lidarr"
  base_url        = "http://lidarr:${module.api.ports["lidarr"]}"
  prowlarr_url    = local.prowlarr_url
  api_key         = module.api.keys["lidarr"]
  sync_level      = var.default-sync_level
  sync_categories = [3000, 3010, 3030, 3040, 3050, 3060]
}

# Sync Profiles
resource "prowlarr_sync_profile" "standard" {
  name                      = "Standard"
  enable_automatic_search   = true
  enable_interactive_search = true
  enable_rss                = true
  minimum_seeders           = 1
}
