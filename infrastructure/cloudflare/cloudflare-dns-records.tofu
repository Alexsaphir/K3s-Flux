locals {
  zone_id = yamldecode(data.bitwarden-secrets_secret.cloudflare.value).CLOUDFLARE_ZONE_ID
}

resource "cloudflare_dns_record" "main" {
  ttl     = 1
  type    = "A"
  proxied = false

  name    = "alexsaphir.com"
  content = "82.66.189.53"

  zone_id = local.zone_id
}
