terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
}

data "kubernetes_secret" "media-secrets" {
  for_each = toset(var.arrs-name)
  metadata {
    name      = "${each.key}-secret"
    namespace = "media"
  }
}
