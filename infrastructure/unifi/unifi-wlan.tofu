data "unifi_user_group" "default" {
  name = "Default"
}

resource "unifi_wlan" "sph" {
  name     = "SPH"
  security = "wpapsk"

  user_group_id = data.unifi_user_group.default.id

  bss_transition    = true
  mac_filter_policy = "allow"
  multicast_enhance = true
  no2ghz_oui        = false
  pmf_mode          = "required"
  proxy_arp         = true
  uapsd             = true
  wpa3_support      = true

  minimum_data_rate_2g_kbps = 1000
  minimum_data_rate_5g_kbps = 6000

  passphrase = yamldecode(data.bitwarden-secrets_secret.unifi.value).UNIFI_WLAN_KEY
}


import {
  id = "68b85ca2fa53f71a838bc2e3"
  to = unifi_wlan.sph
}
