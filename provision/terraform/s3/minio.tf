locals {
  minio_buckets_nas = [
    "loki",
    "thanos",
    "backup-cloudnative",
    "backup-mariadb-media",
    "backup-longhorn",
    "backup-volsync",
  ]
  minio_buckets_k3s = [
    "codecov",
    "ghost",
    "monica",
    "netbox",
    "recipes",
    "renovate"
  ]
}

data "sops_file" "minio-creds-nas" {
  source_file = "minio-nas.sops.yaml"
}

data "sops_file" "minio-creds-k3s" {
  source_file = "minio-k3s.sops.yaml"
}

module "minio_bucket_nas" {
  for_each         = toset(local.minio_buckets_nas)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = each.key
  owner_secret_key = data.sops_file.minio-creds-nas.data["${each.key}_secret_key"]
  providers        = { minio = minio.nas }
}

output "minio_bucket_outputs_nas" {
  value     = module.minio_bucket_nas
  sensitive = true
}

module "minio_bucket" {
  for_each         = toset(local.minio_buckets_k3s)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = each.key
  owner_secret_key = data.sops_file.minio-creds-k3s.data["${each.key}_secret_key"]
  providers        = { minio = minio.k3s }
}

output "minio_bucket_outputs_k3s" {
  value     = module.minio_bucket
  sensitive = true
}
