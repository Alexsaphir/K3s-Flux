variable "nas-buckets" {
  description = "List of Minio buckets to manage with `nas`."
  type        = list(string)
  default = [
    "loki",
    "thanos",
    "backup-cloudnative",
    "backup-longhorn",
    "backup-volsync"
  ]
}

module "minio_buckets_nas" {
  for_each         = toset(var.nas-buckets)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = each.key
  owner_secret_key = data.sops_file.minio-creds-nas.data["${each.key}_secret_key"]
  providers        = { minio = minio.nas }
}
