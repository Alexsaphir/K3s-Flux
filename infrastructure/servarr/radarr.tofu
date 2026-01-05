resource "radarr_root_folder" "movies" {
  path = "/media/Movies"
}

resource "radarr_root_folder" "movies-4k" {
  path     = "/media/Movies - 4k"
  provider = radarr.radarr4k
}


import {
  id = "2"
  to = radarr_root_folder.movies
}
import {
  id = "1"
  to = radarr_root_folder.movies-4k
}
