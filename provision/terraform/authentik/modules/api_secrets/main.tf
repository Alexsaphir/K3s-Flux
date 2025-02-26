terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}

data "kubernetes_secret" "bootstrap-secret" {
  metadata {
    name      = "authentik-bootstrap-secret"
    namespace = var.namespace
  }
}

data "kubernetes_secret" "cluster-secrets" {
  metadata {
    name      = "cluster-secrets"
    namespace = "flux-system"
  }
}
