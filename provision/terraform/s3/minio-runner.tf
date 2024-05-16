# resource "minio_s3_bucket" "bucket" {
#   provider = minio.k3s
#   bucket   = "gitlab-runner"
#   acl      = "private"
# }

resource "minio_iam_user" "user" {
  provider      = minio.k3s
  name          = "gitlab-runner"
  force_destroy = true
  secret        = data.sops_file.minio-creds-k3s.data["gitlab-runner_secret_key"]
}

resource "minio_iam_policy" "rw_policy" {
  provider = minio.k3s
  name     = "gitlab-runner-rw-solo"
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

resource "minio_iam_user_policy_attachment" "user_rw" {
  provider    = minio.k3s
  user_name   = minio_iam_user.user.name
  policy_name = minio_iam_policy.rw_policy.id
}
