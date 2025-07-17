# resource "unifi_network" "default" {
#   name    = "Default"
#   purpose = "corporate"
#   vlan_id      = 0
#   site         = var.site
#
#   subnet = "192.168.0.0/24"
#   ipv6_interface_type          = "single_network"
#
#   domain_name = "local"
#
#   dhcp_enabled = true
#   dhcp_start = "192.168.0.50"
#   dhcp_stop = "192.168.0.150"
#
#   dhcp_v6_start                = "::2"
#   dhcp_v6_stop                 = "::7d1"
#
# }

resource "unifi_network" "talos" {
  name    = "Talos"
  purpose = "corporate"

  vlan_id = 42

  subnet = "192.168.42.0/24"

  dhcp_enabled  = true
  dhcp_start    = "192.168.42.6"
  dhcp_stop     = "192.168.42.50"
  dhcp_v6_start = "::2"
  dhcp_v6_stop  = "::7d1"

  ipv6_interface_type    = "static"
  ipv6_static_subnet     = "2a01:e0a:2a:5552::/64"
  ipv6_pd_start          = "::2"
  ipv6_pd_stop           = "::7d1"
  ipv6_ra_enable         = true
  ipv6_ra_priority       = "high"
  ipv6_ra_valid_lifetime = 0

  igmp_snooping = true
  multicast_dns = true
}

resource "unifi_network" "jetkvm" {
  name    = "JetKVM"
  purpose = "corporate"

  vlan_id = 3

  subnet = "192.168.2.0/24"

  dhcp_enabled  = true
  dhcp_start    = "192.168.2.6"
  dhcp_stop     = "192.168.2.254"
  dhcp_v6_start = "::2"
  dhcp_v6_stop  = "::7d1"

  ipv6_pd_start          = "::2"
  ipv6_pd_stop           = "::7d1"
  ipv6_ra_enable         = true
  ipv6_ra_priority       = "high"
  ipv6_ra_valid_lifetime = 0

  multicast_dns = true
}

# import {
#   id = "68713ea09704354fee036a4e"
#   to = unifi_network.default
# }
import {
  id = "68726919d939bb501ffbc995"
  to = unifi_network.talos
}
import {
  id = "68729777d939bb501ffbccb8"
  to = unifi_network.jetkvm
}
