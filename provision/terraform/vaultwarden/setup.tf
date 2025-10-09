terraform {
  required_version = ">= 1.0"

  required_providers {
    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = ">= 0.12.1"
    }
    vaultwarden = {
      source  = "ottramst/vaultwarden"
      version = "0.4.4"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.3.0"
    }
  }
}

module "api" {
  source = "./modules/api_secrets"
}


module "vaultwarden-user" {
  source    = "./modules/vaultwarden_config"
  user_file = "secrets/user.sops.yaml"
}

locals {
  vaultwarden-server = "https://vaultwarden.${module.api.domain_name}"
}
