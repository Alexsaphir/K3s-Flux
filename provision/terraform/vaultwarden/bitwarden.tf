# Bitwarden compatible resources

provider "bitwarden" {
  server = local.vaultwarden-server

  email           = module.vaultwarden-user.email
  master_password = module.vaultwarden-user.master_password

  client_id     = module.vaultwarden-user.client_id
  client_secret = module.vaultwarden-user.client_secret

  experimental {
    embedded_client = true
  }
}

data "bitwarden_organization" "homelab" {
  search = "Homelab"
}

data "bitwarden_folder" "homelab" {
  search = "Homelab"
}
