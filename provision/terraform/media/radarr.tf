resource "radarr_root_folder" "movies" {
  path = "/media/Movies"
}

resource "radarr_naming" "config" {
  rename_movies              = false
  replace_illegal_characters = true
  colon_replacement_format   = "dash"
  movie_folder_format        = "{Movie Title} ({Release Year})"
  standard_movie_format      = "{Movie Title} ({Release Year}) {Quality Full}"
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
