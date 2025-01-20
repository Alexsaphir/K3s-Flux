output "domain_name" {
  description = "Domain name"
  value       = data.kubernetes_secret.cluster-secrets.data["DOMAIN_NAME"]
  sensitive   = true
}

output "admin_token" {
  description = "Vaultwarden admin token"
  value       = data.kubernetes_secret.vaultwarden-secrets.data["ADMIN_TOKEN"]
  sensitive   = true
}
