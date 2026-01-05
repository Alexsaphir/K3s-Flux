resource "unifi_network" "wifi" {
  name    = "WiFi"
  purpose = "corporate"

  subnet  = "192.168.10.1/24"
  vlan_id = 10

  dhcp_enabled       = true
  dhcp_relay_enabled = false
  dhcp_start         = "192.168.10.6"
  dhcp_stop          = "192.168.10.254"

  dhcpd_boot_enabled = false
}

resource "unifi_network" "talos" {
  name    = "Talos"
  purpose = "corporate"

  subnet  = "192.168.42.1/24"
  vlan_id = 42

  dhcp_enabled       = true
  dhcp_relay_enabled = false
  dhcp_start         = "192.168.42.6"
  dhcp_stop          = "192.168.42.254"

  dhcpd_boot_enabled = false
}

resource "unifi_network" "talos-bgp" {
  name    = "BGP - TALOS"
  purpose = "corporate"

  subnet  = "192.168.43.1/24"
  vlan_id = 43

  dhcp_enabled       = false
  dhcp_relay_enabled = false
  dhcp_start         = "192.168.43.6"
  dhcp_stop          = "192.168.43.254"

  dhcpd_boot_enabled = false
}

import {
  id = "68b8b6cefa53f71a838bc7bd"
  to = unifi_network.wifi
}

import {
  id = "688e36a593de7864a7d64401"
  to = unifi_network.talos
}

import {
  id = "68a517f0a3c63b655c2bf7ab"
  to = unifi_network.talos-bgp
}
