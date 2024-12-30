terraform {
  required_version = ">= 1.0"

  required_providers {
    prowlarr = {
      source  = "ottramst/vaultwarden"
      version = "0.4.4"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.1.1"
    }
  }
}
