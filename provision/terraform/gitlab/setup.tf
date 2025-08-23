terraform {
  required_version = ">= 1.0"

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "18.3.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.2.1"
    }
  }
}

module "api" {
  source = "./modules/api_secrets"
}

data "sops_file" "secrets" {
  source_file = "secrets/gitlab.sops.yaml"
}

provider "gitlab" {
  base_url         = "https://gitlab.${module.api.domain_name}/api/v4"
  token            = data.sops_file.secrets.data["token"]
  early_auth_check = true
}
