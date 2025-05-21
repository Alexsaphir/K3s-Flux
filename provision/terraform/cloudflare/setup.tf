terraform {
  required_version = ">= 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.5.0"
    }

    sops = {
      source  = "carlpett/sops"
      version = "1.2.0"
    }
  }
}


module "config" {
  source = "./modules/config"
}

provider "cloudflare" {
  api_token = module.config.token
}
