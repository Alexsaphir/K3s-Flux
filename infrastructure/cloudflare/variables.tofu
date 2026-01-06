variable "access_token" {
  description = "Bitwarden access token"
  type        = string
  sensitive   = true
}

variable "organization_id" {
  description = "Bitwarden organization id"
  type        = string
  sensitive   = true
}
