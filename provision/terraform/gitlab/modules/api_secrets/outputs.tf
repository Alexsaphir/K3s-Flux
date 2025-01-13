output "domain_name" {
  description = "Domain name"
  value       = data.kubernetes_secret.cluster-secrets.data["DOMAIN_NAME"]
  sensitive   = true
}
