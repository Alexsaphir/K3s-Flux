variable "k3s-buckets" {
  description = "List of Minio buckets to manage with `k3s`."
  type        = list(string)
  default = [
    "codecov",
    "forgejo",
    "monica",
    "netbox",
    "recipes",
    "renovate",
    "wikijs",
    "cdash"
  ]
}

module "minio_buckets_k3s" {
  for_each         = toset(var.k3s-buckets)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = each.key
  owner_secret_key = data.sops_file.minio-creds-k3s.data["${each.key}_secret_key"]
  providers        = { minio = minio.k3s }
}
