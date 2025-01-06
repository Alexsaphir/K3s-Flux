output "zone" {
  value     = data.kubernetes_secret.cloudflare-secrets.data["domain"]
  sensitive = true
}

output "token" {
  value     = data.kubernetes_secret.cloudflare-secrets.data["token"]
  sensitive = true
}
