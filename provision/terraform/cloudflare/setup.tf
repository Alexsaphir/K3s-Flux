terraform {
  required_version = ">= 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.8.2"
    }

    sops = {
      source  = "carlpett/sops"
      version = "1.2.1"
    }
  }
}


module "config" {
  source = "./modules/config"
}

provider "cloudflare" {
  api_token = module.config.token
}
