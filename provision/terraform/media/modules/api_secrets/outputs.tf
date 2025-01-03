locals {
  decoded_secrets = {
    for app, secret in data.kubernetes_secret.secrets :
    app => secret.data["api_key"]
  }

  decoded_ports = {
    for app, service in data.kubernetes_service.services :
    app => service.spec[0].port[0].port
  }
}

output "keys" {
  description = "Map between arr-applications and their api key."
  value       = local.decoded_secrets
  sensitive   = true
}

output "ports" {
  description = "Map between arr-applications and their port."
  value       = local.decoded_ports
}

output "domain_name" {
  description = "Domain name"
  value       = data.kubernetes_secret.cluster-secrets.data["DOMAIN_NAME"]
  sensitive   = true
}
