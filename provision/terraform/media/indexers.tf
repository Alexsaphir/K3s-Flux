data "sops_file" "indexers" {
  source_file = "secrets/indexers.sops.yaml"
}

resource "prowlarr_indexer" "nzbgeek" {
  enable          = true
  name            = "NZBgeek"
  implementation  = "Newznab"
  config_contract = "NewznabSettings"
  app_profile_id  = 1
  protocol        = "usenet"
  priority        = 10

  tags = []

  fields = [
    {
      name       = "baseUrl",
      text_value = "https://api.nzbgeek.info"
    },
    {
      name       = "apiPath"
      text_value = "/api"
    },
    {
      name            = "apiKey"
      sensitive_value = data.sops_file.indexers.data["nzbgeek"]
    },
    {
      name       = "vipExpiration"
      text_value = "2025-11-18"
    },
    {
      name         = "baseSettings.limitsUnit"
      number_value = 0
    }
  ]
}

resource "prowlarr_indexer" "nzbfinder" {
  enable          = true
  name            = "NZBFinder"
  implementation  = "Newznab"
  config_contract = "NewznabSettings"
  app_profile_id  = 1
  protocol        = "usenet"
  priority        = 1

  tags = []

  fields = [
    {
      "name"       = "baseUrl"
      "text_value" = "https://nzbfinder.ws"
    },
    {
      "name"       = "apiPath"
      "text_value" = "/api"
    },
    {
      "name"            = "apiKey"
      "sensitive_value" = data.sops_file.indexers.data["nzbfinder"]
    },
    {
      "name"       = "vipExpiration"
      "text_value" = "2025-11-10"
    },
    {
      "name"         = "baseSettings.limitsUnit"
      "number_value" = 0
    }
  ]
}

resource "prowlarr_indexer" "nyaa" {
  enable          = true
  name            = "Nyaa.si"
  implementation  = "Cardigann"
  config_contract = "CardigannSettings"
  app_profile_id  = 1
  protocol        = "torrent"
  priority        = 25

  tags = []

  fields = [
    {
      "name"         = "baseSettings.limitsUnit"
      "number_value" = 0
    },
    {
      "name"       = "baseUrl"
      "text_value" = "https://nyaa.si/"
    },
    {
      "name"         = "cat-id"
      "number_value" = 0
    },
    {
      "name"       = "definitionFile"
      "text_value" = "nyaasi"
    },
    {
      "name"         = "filter-id"
      "number_value" = 0
    },
    {
      "name"         = "sort"
      "number_value" = 0
    },
    {
      "bool_value" = true
      "name"       = "prefer_magnet_links"
    },
    {
      "name"         = "type"
      "number_value" = 1
    },
    {
      "bool_value" = false
      "name"       = "radarr_compatibility"
    },
    {
      "bool_value" = false
      "name"       = "strip_s01"
    },
    {
      "bool_value" = false
      "name"       = "torrentBaseSettings.preferMagnetUrl"
    },
    {
      "name"         = "torrentBaseSettings.seedRatio"
      "number_value" = 1
    },
    {
      "bool_value" = true
      "name"       = "sonarr_compatibility"
    },
  ]
}

resource "prowlarr_indexer" "eztv" {
  enable          = true
  name            = "EZTV"
  implementation  = "Cardigann"
  config_contract = "CardigannSettings"
  app_profile_id  = 1
  protocol        = "torrent"
  priority        = 50

  tags = []

  fields = [
    {
      "bool_value" = false
      "name"       = "torrentBaseSettings.preferMagnetUrl"
    },
    {
      "name"         = "baseSettings.limitsUnit"
      "number_value" = 0
    },
    {
      "name"       = "baseUrl"
      "text_value" = "https://eztvx.to/"
    },
    {
      "name"       = "definitionFile"
      "text_value" = "eztv"
    },
  ]
}

resource "prowlarr_indexer" "nyaaa" {
  enable          = true
  name            = "sukebei.nyaa.si"
  implementation  = "Cardigann"
  config_contract = "CardigannSettings"
  app_profile_id  = 1
  protocol        = "torrent"
  priority        = 25

  tags = []

  fields = [
    {
      "bool_value" = false
      "name"       = "torrentBaseSettings.preferMagnetUrl"
    },
    {
      "name"         = "baseSettings.limitsUnit"
      "number_value" = 0
    },
    {
      "name"       = "baseUrl"
      "text_value" = "https://sukebei.nyaa.si/"
    },
    {
      "name"         = "cat-id"
      "number_value" = 0
    },
    {
      "name"       = "definitionFile"
      "text_value" = "sukebeinyaasi"
    },
    {
      "name"         = "filter-id"
      "number_value" = 0
    },
    {
      "name"         = "sort"
      "number_value" = 0
    },
    {
      "name"         = "torrentBaseSettings.seedRatio"
      "number_value" = 2
    },
    {
      "name"         = "type"
      "number_value" = 1
    },
  ]
}
