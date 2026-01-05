resource "radarr_root_folder" "movies" {
  path = "/media/Movies${var.is4k ? " - 4k" : ""}"
}

resource "sonarr_root_folder" "tv" {
  path = "/media/TV Shows${var.is4k ? " - 4k" : ""}"
}
resource "sonarr_root_folder" "anime" {
  path = "/media/Anime${var.is4k ? " - 4k" : ""}"
}
