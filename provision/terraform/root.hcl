generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
terraform {
  backend "http" {
    address        = "${get_env("TF_STATE_BASE_ADDRESS")}/${path_relative_to_include()}"
    lock_address   = "${get_env("TF_STATE_BASE_ADDRESS")}/${path_relative_to_include()}/lock"
    unlock_address = "${get_env("TF_STATE_BASE_ADDRESS")}/${path_relative_to_include()}/lock"
    username       = "${get_env("TF_USERNAME")}"
    password       = "${get_env("TF_HTTP_PASSWORD")}"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = 5
  }
}
EOF
}
