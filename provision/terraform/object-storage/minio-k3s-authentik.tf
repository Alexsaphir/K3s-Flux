variable "k3s-authentik-buckets" {
  description = "List of Minio buckets for `authentik` to manage with `k3s`."
  type        = list(string)
  default = [
    "authentik",
  ]

  validation {
    condition     = alltrue([for bucket in var.k3s-authentik-buckets : startswith(bucket, "authentik")])
    error_message = "Each bucket name must start with 'authentik'."
  }
}

data "sops_file" "minio-k3s-authentik" {
  source_file = "secrets/minio-k3s-authentik.sops.yaml"
}

module "minio_buckets_k3s_authentik" {
  for_each         = toset(var.k3s-authentik-buckets)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = "authentik"
  owner_secret_key = data.sops_file.minio-k3s-authentik.data["authentik_secret_key"]
  providers        = { minio = minio.k3s }
}
