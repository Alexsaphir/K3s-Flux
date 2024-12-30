module "sabnzbd-clients" {
  source      = "./modules/sabnzbd"
  source_file = "secrets/sabnzbd.sops.yaml"
  name        = "SABnzbd"
}

module "deluge-clients" {
  source        = "./modules/deluge"
  source_file   = "secrets/deluge.sops.yaml"
  name          = "deluge"
  use_ssl       = true
  item_priority = 0
}
