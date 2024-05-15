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
