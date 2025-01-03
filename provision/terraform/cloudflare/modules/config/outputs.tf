output "zone" {
  value     = data.kubernetes_secret.cluster-secrets.data["SECRET_CF_DOMAIN"]
  sensitive = true
}

output "token" {
  value     = data.kubernetes_secret.cluster-secrets.data["SECRET_CF_TOKEN"]
  sensitive = true
}
