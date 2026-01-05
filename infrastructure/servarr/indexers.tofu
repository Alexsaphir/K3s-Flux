resource "prowlarr_indexer" "nzbgeek" {
  enable          = true
  app_profile_id  = 1
  config_contract = "NewznabSettings"
  implementation  = "Newznab"
  name            = "NZBgeek"
  protocol        = "usenet"
  priority        = 25
  redirect        = true
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
      sensitive_value = yamldecode(data.bitwarden-secrets_secret.nzbgeek.value).NZBGEEK_API_KEY
    },
    {
      name       = "vipExpiration"
      text_value = "2026-11-20"
    },
    {
      name         = "baseSettings.limitsUnit"
      number_value = 0
    }
  ]

  tags = []
}


import {
  id = "1"
  to = prowlarr_indexer.nzbgeek
}
