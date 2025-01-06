terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
}

data "kubernetes_secret" "cloudflare-secrets" {
  metadata {
    name      = "cloudflare-provision-secrets"
    namespace = "flux-provision"
  }
}
