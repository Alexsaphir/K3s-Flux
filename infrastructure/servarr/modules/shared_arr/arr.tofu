resource "radarr_delay_profile" "default" {
  enable_usenet             = true
  enable_torrent            = true
  bypass_if_highest_quality = true
  usenet_delay              = 0
  torrent_delay             = 5
  tags                      = []
  preferred_protocol        = "usenet"
}

resource "sonarr_delay_profile" "default" {
  enable_usenet             = true
  enable_torrent            = true
  bypass_if_highest_quality = true
  usenet_delay              = 0
  torrent_delay             = 5
  tags                      = []
  preferred_protocol        = "usenet"
}


resource "radarr_media_management" "config" {
  auto_unmonitor_previously_downloaded_movies = false
  recycle_bin                                 = ""
  recycle_bin_cleanup_days                    = 7
  download_propers_and_repacks                = "preferAndUpgrade"
  create_empty_movie_folders                  = false
  delete_empty_folders                        = true
  file_date                                   = "none"
  rescan_after_refresh                        = "always"
  auto_rename_folders                         = false
  paths_default_static                        = false
  set_permissions_linux                       = false
  chmod_folder                                = 755
  chown_group                                 = ""
  skip_free_space_check_when_importing        = true
  minimum_free_space_when_importing           = 100
  copy_using_hardlinks                        = true
  import_extra_files                          = true
  extra_file_extensions                       = "srt"
  enable_media_info                           = true
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
