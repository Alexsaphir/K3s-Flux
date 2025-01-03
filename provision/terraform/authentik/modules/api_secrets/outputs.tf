output "bootstrap_token" {
  description = "Token created during bootstrap."
  value       = data.kubernetes_secret.bootstrap-secret.data["AUTHENTIK_BOOTSTRAP_TOKEN"]
  sensitive   = true
}

output "domain_name" {
  description = "Domain name"
  value       = data.kubernetes_secret.cluster-secrets.data["DOMAIN_NAME"]
  sensitive   = true
}
