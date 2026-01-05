# Sync Profiles
resource "prowlarr_sync_profile" "standard" {
  name                      = "Standard"
  enable_automatic_search   = true
  enable_interactive_search = true
  enable_rss                = true
  minimum_seeders           = 1
}


import {
  id = "1"
  to = prowlarr_sync_profile.standard
}
