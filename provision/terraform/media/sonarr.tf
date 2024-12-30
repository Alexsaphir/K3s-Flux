resource "sonarr_root_folder" "series" {
  path = "/media/TV Shows"
}

resource "sonarr_root_folder" "anime" {
  path = "/media/Anime"
}

resource "sonarr_naming" "config" {
  rename_episodes            = false
  replace_illegal_characters = true
  multi_episode_style        = 0
  colon_replacement_format   = 4
  standard_episode_format    = "{Series Title} - S{season:00}E{episode:00} - {Episode Title} - {Quality Full}"
  daily_episode_format       = "{Series Title} - {Air-Date} - {Episode Title} - {Quality Full}"
  anime_episode_format       = "{Series Title} - S{season:00}E{episode:00} - {Episode Title} - {Quality Full}"
  series_folder_format       = "{Series Title}"
  season_folder_format       = "Season {season:00}"
  specials_folder_format     = "Specials"
}

resource "sonarr_media_management" "config" {
  unmonitor_previous_episodes = false
  hardlinks_copy              = true
  create_empty_folders        = false
  delete_empty_folders        = true
  enable_media_info           = true
  import_extra_files          = true
  set_permissions             = false
  skip_free_space_check       = true
  minimum_free_space          = 100
  recycle_bin_days            = 7
  chmod_folder                = "755"
  chown_group                 = ""
  download_propers_repacks    = "preferAndUpgrade"
  episode_title_required      = "always"
  extra_file_extensions       = "srt"
  file_date                   = "none"
  recycle_bin_path            = ""
  rescan_after_refresh        = "always"
}
