terraform {
  required_version = ">= 1.0"

  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "3.2.2"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.1.1"
    }
  }
}

data "sops_file" "minio-creds-nas" {
  source_file = "secrets/minio-nas.sops.yaml"
}

data "sops_file" "minio-creds-k3s" {
  source_file = "secrets/minio-k3s.sops.yaml"
}
