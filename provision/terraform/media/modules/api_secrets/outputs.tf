locals {
  decoded_secrets = {
    for app, secret in data.kubernetes_secret.media-secrets :
    app => secret.data[app == "readarr" ? "${upper(app)}__API_KEY" : "${upper(app)}__AUTH__APIKEY"]
  }
}

output "keys" {
  description = "Map between arr-applications and their api key."
  value       = local.decoded_secrets
  sensitive   = true
}
