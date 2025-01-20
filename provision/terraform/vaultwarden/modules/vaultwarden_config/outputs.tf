output "email" {
  description = "email"
  value       = data.sops_file.vaultwarden-user.data["email"]
  sensitive   = true
}
output "master_password" {
  description = "master_password"
  value       = data.sops_file.vaultwarden-user.data["master_password"]
  sensitive   = true
}

output "client_id" {
  description = "client_id"
  value       = data.sops_file.vaultwarden-user.data["client_id"]
  sensitive   = true
}

output "client_secret" {
  description = "client_secret"
  value       = data.sops_file.vaultwarden-user.data["client_secret"]
  sensitive   = true
}
