locals {
  minio_buckets = [
    "loki",
    "thanos",
    "backup-cloudnative",
    "backup-longhorn",
    "backup-volsync",
  ]
}

data "sops_file" "minio-creds" {
  source_file = "minio-nas.sops.yaml"
}

module "minio_bucket" {
  for_each         = toset(local.minio_buckets)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = each.key
  owner_secret_key = lookup(data.sops_file.minio-creds, "${each.key}_secret_key", null)
  providers        = { minio = minio.nas }
}
output "minio_bucket_outputs" {
  value     = module.minio_bucket
  sensitive = true
}
