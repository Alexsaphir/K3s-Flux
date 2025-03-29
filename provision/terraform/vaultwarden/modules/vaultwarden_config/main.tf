terraform {
  required_version = ">= 1.0"
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "1.2.0"
    }
  }
}

data "sops_file" "vaultwarden-user" {
  source_file = var.user_file
}
