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
    "forgejo",
    "monica",
    "netbox",
    "recipes",
    "renovate"
  ]
  gitlab_buckets_k3s = [
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
    "gitlab-uploads-storage"
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
  providers = { minio = minio.nas }
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
  providers = { minio = minio.k3s }
}

output "minio_bucket_outputs_k3s" {
  value     = module.minio_bucket
  sensitive = true
}


module "minio_bucket_gitlab" {
  for_each         = toset(local.gitlab_buckets_k3s)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = "gitlab"
  owner_secret_key = data.sops_file.minio-creds-k3s.data["gitlab_secret_key"]
  providers = { minio = minio.k3s }
}

output "gitlab_bucket_outputs_k3s" {
  value     = module.minio_bucket_gitlab
  sensitive = true
}
