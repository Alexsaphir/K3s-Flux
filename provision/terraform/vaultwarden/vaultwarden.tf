# Vaultwarden specific resources

provider "vaultwarden" {
  endpoint = local.vaultwarden-server

  admin_token = module.api.admin_token

  email           = module.vaultwarden-user.email
  master_password = module.vaultwarden-user.master_password

  client_id     = module.vaultwarden-user.client_id
  client_secret = module.vaultwarden-user.client_secret
}

resource "vaultwarden_organization" "homelab" {
  name = "Homelab"
}

resource "vaultwarden_organization_collection" "kubernetes" {
  name            = "Kubernetes"
  organization_id = vaultwarden_organization.homelab.id
}

resource "vaultwarden_organization_collection" "tofu" {
  name            = "Tofu"
  organization_id = vaultwarden_organization.homelab.id
}
