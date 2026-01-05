locals {
  radarr4k-api-key = yamldecode(data.bitwarden-secrets_secret.radarr.value).RADARR4K_API_KEY
  sonarr4k-api-key = yamldecode(data.bitwarden-secrets_secret.sonarr.value).SONARR4K_API_KEY
}

module "shared-arr-4k" {
  source = "./modules/shared_arr"
  providers = {
    sonarr = sonarr.sonarr4k
    radarr = radarr.radarr4k
  }

  is4k = true

  radarr-api-key = local.radarr4k-api-key
  sonarr-api-key = local.sonarr4k-api-key
}


# Prowlarr applications
import {
  id = "4"
  to = module.shared-arr-4k.prowlarr_application_radarr.radarr
}
import {
  id = "2"
  to = module.shared-arr-4k.prowlarr_application_sonarr.sonarr
}

# Root folder
import {
  id = "2"
  to = module.shared-arr-4k.radarr_root_folder.movies
}
import {
  id = "4"
  to = module.shared-arr-4k.sonarr_root_folder.tv
}
import {
  id = "3"
  to = module.shared-arr-4k.sonarr_root_folder.anime
}

# Config
import {
  id = "1"
  to = module.shared-arr-4k.radarr_delay_profile.default
}
import {
  id = "1"
  to = module.shared-arr-4k.sonarr_delay_profile.default
}
import {
  id = "1"
  to = module.shared-arr-4k.radarr_media_management.config
}
import {
  id = "1"
  to = module.shared-arr-4k.sonarr_media_management.config
}
import {
  id = "1"
  to = module.shared-arr-4k.radarr_naming.media_naming_configs
}
import {
  id = "1"
  to = module.shared-arr-4k.sonarr_naming.media_naming_configs
}
