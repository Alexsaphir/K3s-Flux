resource "radarr_naming" "media_naming_configs" {
  rename_movies              = true
  replace_illegal_characters = true

  colon_replacement_format = "dash"

  standard_movie_format = "{Movie CleanTitle} {(Release Year)} [imdbid-{ImdbId}] - {Edition Tags }{[Custom Formats]}{[Quality Full]}{[MediaInfo 3D]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}[{Mediainfo VideoCodec}]{-Release Group}"
  movie_folder_format   = "{Movie Title} ({Release Year})"
}

resource "sonarr_naming" "media_naming_configs" {
  rename_episodes            = true
  replace_illegal_characters = true

  multi_episode_style      = 5
  colon_replacement_format = 4

  standard_episode_format = "{Series TitleYear} - S{season:00}E{episode:00} - {Episode CleanTitle} [{Custom Formats }{Quality Full}]{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoCodec]}{-Release Group}"
  daily_episode_format    = "{Series TitleYear} - {Air-Date} - {Episode CleanTitle} [{Custom Formats }{Quality Full}]{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoCodec]}{-Release Group}"
  anime_episode_format    = "{Series Title} - S{season:00}E{episode:00} - {Episode Title} {Quality Full}"
  series_folder_format    = "{Series Title}"
  season_folder_format    = "Season {season:00}"
  specials_folder_format  = "Season 00"
}
