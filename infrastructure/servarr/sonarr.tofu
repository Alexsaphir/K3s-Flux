resource "sonarr_root_folder" "tv" {
  path = "/media/TV Shows"
}
resource "sonarr_root_folder" "anime" {
  path = "/media/Anime"
}

resource "sonarr_root_folder" "tv-4k" {
  path     = "/media/TV Shows - 4k"
  provider = sonarr.sonarr4k
}
resource "sonarr_root_folder" "anime-4k" {
  path     = "/media/Anime - 4k"
  provider = sonarr.sonarr4k
}


import {
  id = "2"
  to = sonarr_root_folder.tv
}
import {
  id = "3"
  to = sonarr_root_folder.anime
}

import {
  id = "1"
  to = sonarr_root_folder.tv-4k
}
import {
  id = "2"
  to = sonarr_root_folder.anime-4k
}
