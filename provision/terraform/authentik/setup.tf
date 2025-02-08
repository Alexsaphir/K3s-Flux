terraform {
  required_version = ">= 1.0"

  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "1.1.1"
    }
    authentik = {
      source  = "goauthentik/authentik"
      version = "2024.12.1"
    }
  }
}

# This module allow to fetch the secret from kubernetes.
module "api" {
  source = "./modules/api_secrets"
}

provider "authentik" {
  url   = "https://authentik.${module.api.domain_name}"
  token = module.api.bootstrap_token
}
