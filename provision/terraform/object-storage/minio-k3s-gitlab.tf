variable "k3s-gitlab-buckets" {
  description = "List of Minio buckets for `gitlab` to manage with `k3s`."
  type        = list(string)
  default = [
    "gitlab-artifacts-storage",
    "gitlab-dependency-proxy-storage",
    "gitlab-external-diffs-storage",
    "gitlab-lfs-storage",
    "gitlab-mattermost",
    "gitlab-packages-storage",
    "gitlab-pages-storage",
    "gitlab-registry",
    "gitlab-runner",
    "gitlab-terraform-state-storage",
    "gitlab-uploads-storage",
    "gitlab-ci-secure-files"
  ]

  validation {
    condition     = alltrue([for bucket in var.k3s-gitlab-buckets : startswith(bucket, "gitlab-")])
    error_message = "Each bucket name must start with 'gitlab-'."
  }
}

data "sops_file" "minio-k3s-gitlab" {
  source_file = "secrets/minio-k3s-gitlab.sops.yaml"
}

module "minio_buckets_k3s_gitlab" {
  for_each         = toset(var.k3s-gitlab-buckets)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = "gitlab"
  owner_secret_key = data.sops_file.minio-k3s-gitlab.data["gitlab_secret_key"]
  providers        = { minio = minio.k3s }
}
