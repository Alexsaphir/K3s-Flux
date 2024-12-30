variable "planka-buckets" {
  description = "List of buckets used by a Planka instance."
  type        = list(string)
  default     = ["planka", "planka-prod"]
  validation {
    condition     = alltrue([for bucket in var.planka-buckets : startswith(bucket, "planka")])
    error_message = "Each bucket name must start with 'planka'."
  }
}

variable "planka-buckets-size_GB" {
  description = "Quota allowed for each bucket (in GB)."
  type        = number
  default     = 5
}

data "sops_file" "minio-creds-k3s-planka" {
  source_file = "secrets/minio-k3s-planka.sops.yaml"
}

module "minio_buckets_k3s_planka" {
  for_each         = toset(var.planka-buckets)
  source           = "./modules/minio_bucket"
  bucket_name      = each.key
  is_public        = false
  owner_access_key = each.key
  owner_secret_key = data.sops_file.minio-creds-k3s-planka.data["${each.key}_secret_key"]
  quota            = var.planka-buckets-size_GB * 1024 * 1024 * 1024
  providers        = { minio = minio.k3s }
}

resource "minio_s3_bucket_policy" "public_anonymous" {
  for_each = toset(var.planka-buckets)

  provider = minio.k3s
  bucket   = each.key
  policy   = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${each.key}/public/*"
        }
    ]
}
EOF
}
