# Create an user and a policy such as it can be used to only access the bucket named `gitlab-runner`.

variable "gitlab-runner-bucket" {
  description = "Name of the S3 bucket for the gitlab runner."
  type        = string
  default     = "gitlab-runner"
  validation {
    condition     = startswith(var.gitlab-runner-bucket, "gitlab-")
    error_message = "The gitlab-runner bucket name must start with 'gitlab-'."
  }
}

variable "gitlab-runner-users" {
  description = "Gitlab Runner IAM list of users with read-write access to GitLab runners."
  type        = list(string)
  default     = ["gitlab-runner"]
  validation {
    condition     = alltrue([for bucket in var.gitlab-runner-users : startswith(bucket, "gitlab-runner")])
    error_message = "Each user name must start with 'gitlab-runner'."
  }
}

locals {
  # Ensure that the bucket is already managed.
  # tflint-ignore: terraform_unused_declarations
  __validate_runner_bucket = contains(var.k3s-gitlab-buckets, var.gitlab-runner-bucket)
}

data "sops_file" "minio-k3s-gitlab-users" {
  source_file = "secrets/minio-k3s-gitlab-users.sops.yaml"
}

resource "minio_iam_user" "gitlab-runner-users" {
  for_each = toset(var.gitlab-runner-users)

  provider      = minio.k3s
  name          = each.key
  force_destroy = true
  secret        = data.sops_file.minio-k3s-gitlab-users.data["${each.key}_secret_key"]
}

# Define a policy granting full access to the `gitlab-runner` bucket.
resource "minio_iam_policy" "gitlab-runner-user-rw_policy" {
  provider = minio.k3s
  name     = "gitlab-runner-rw"
  policy   = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::gitlab-runner",
                "arn:aws:s3:::gitlab-runner/*"
            ],
            "Sid": ""
        }
    ]
}
EOF
}

# Attach the policy to the `gitlab-runner` user.
resource "minio_iam_user_policy_attachment" "gitlab-runner-user-policy" {
  for_each = toset(var.gitlab-runner-users)

  provider    = minio.k3s
  user_name   = each.key
  policy_name = minio_iam_policy.gitlab-runner-user-rw_policy.id
}
