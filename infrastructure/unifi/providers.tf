terraform {
  required_version = ">= 1.0"
  required_providers {
    unifi = {
      source  = "filipowm/unifi"
      version = "1.0.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.2.0"
    }
  }
}
data "sops_file" "unifi-user" {
  source_file = "secrets/unifi.sops.yaml"
}

provider "unifi" {
  api_url        = var.api_url
  api_key        = data.sops_file.unifi-user.data["unifi-api-key"]
  allow_insecure = true
  site           = var.site
}
