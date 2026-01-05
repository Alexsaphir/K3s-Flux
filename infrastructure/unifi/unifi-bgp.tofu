resource "unifi_bgp" "talos" {
  description      = "Talos"
  enabled          = true
  upload_file_name = "frr.conf"

  config = <<EOF
log syslog
!
hostname UCG-Fiber
frr defaults traditional
!
router bgp 64600
  bgp router-id 192.168.0.1
  bgp log-neighbor-changes

  ! Uncomment the next 2 lines to disable ECMP
  ! maximum-paths 1
  ! maximum-paths ibgp 1

  no bgp ebgp-requires-policy
  no bgp default ipv4-unicast

  ! Peer group for Cilium nodes
  neighbor cilium peer-group
  neighbor cilium remote-as 65100
  neighbor cilium timers 3 9
  neighbor cilium timers connect 5

  ! neighbor cilium capability extended-nexthop

  ! common settings applied to all neighbor in this peer group
  neighbor cilium soft-reconfiguration inbound


  ! Enable dynamic neighbor discovery
  bgp listen range 2a01:e0a:2a:5552::/64 peer-group cilium
  bgp listen limit 16


  address-family ipv4 unicast
    neighbor cilium activate
    neighbor cilium next-hop-self
  exit-address-family

  address-family ipv6 unicast
    neighbor cilium activate
    neighbor cilium next-hop-self
  exit-address-family
!
line vty
EOF
}


import {
  id = "68a513d4a3c63b655c2bf778"
  to = unifi_bgp.talos
}
