terraform {
  required_version = ">= 1.0"

  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "2.5.1"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.1.1"
    }
  }
}
