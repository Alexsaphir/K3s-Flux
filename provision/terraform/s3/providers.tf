provider "minio" {
  alias          = "nas"
  minio_server   = "192.168.0.130:9768"
  minio_user     = data.sops_file.minio-creds.data["root_access_key"]
  minio_password = data.sops_file.minio-creds.data["root_secret_key"]
}
