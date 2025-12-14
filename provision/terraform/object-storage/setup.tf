terraform {
  required_version = ">= 1.0"

  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "3.12.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.3.0"
    }
  }
}

provider "minio" {
  alias          = "nas"
  minio_server   = "192.168.0.130:9000"
  minio_user     = data.sops_file.minio-creds-nas.data["root_access_key"]
  minio_password = data.sops_file.minio-creds-nas.data["root_secret_key"]
}

provider "minio" {
  alias          = "k3s"
  minio_server   = "s3.alexsaphir.com"
  minio_ssl      = "true"
  minio_user     = data.sops_file.minio-creds-k3s.data["root_access_key"]
  minio_password = data.sops_file.minio-creds-k3s.data["root_secret_key"]
}


data "sops_file" "minio-creds-nas" {
  source_file = "secrets/minio-nas.sops.yaml"
}

data "sops_file" "minio-creds-k3s" {
  source_file = "secrets/minio-k3s.sops.yaml"
}
