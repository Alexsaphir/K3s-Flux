terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.0"
    }
  }
}

data "kubernetes_secret" "cloudflare-secrets" {
  metadata {
    name      = "cloudflare-provision-secrets"
    namespace = "flux-provision"
  }
}
