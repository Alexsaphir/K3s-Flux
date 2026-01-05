locals {
  radarr-api-key = yamldecode(data.bitwarden-secrets_secret.radarr.value).RADARR_API_KEY
  sonarr-api-key = yamldecode(data.bitwarden-secrets_secret.sonarr.value).SONARR_API_KEY
}

module "shared-arr" {
  source = "./modules/shared_arr"

  radarr-api-key = local.radarr-api-key
  sonarr-api-key = local.sonarr-api-key
}


# Prowlarr applications
import {
  id = "3"
  to = module.shared-arr.prowlarr_application_radarr.radarr
}
import {
  id = "1"
  to = module.shared-arr.prowlarr_application_sonarr.sonarr
}

# NZBGet
import {
  id = "34"
  to = module.shared-arr.prowlarr_download_client_nzbget.prowlarr[0]
}

# Root folder
import {
  id = "3"
  to = module.shared-arr.radarr_root_folder.movies
}
import {
  id = "4"
  to = module.shared-arr.sonarr_root_folder.tv
}
import {
  id = "5"
  to = module.shared-arr.sonarr_root_folder.anime
}

# Config
import {
  id = "1"
  to = module.shared-arr.radarr_delay_profile.default
}
import {
  id = "1"
  to = module.shared-arr.sonarr_delay_profile.default
}
import {
  id = "1"
  to = module.shared-arr.radarr_media_management.config
}
import {
  id = "1"
  to = module.shared-arr.sonarr_media_management.config
}
import {
  id = "1"
  to = module.shared-arr.radarr_naming.media_naming_configs
}
import {
  id = "1"
  to = module.shared-arr.sonarr_naming.media_naming_configs
}
