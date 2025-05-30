terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.37.1"
    }
  }
}

data "kubernetes_secret" "cluster-secrets" {
  metadata {
    name      = "cluster-secrets"
    namespace = "flux-system"
  }
}

data "kubernetes_secret" "vaultwarden-secrets" {
  metadata {
    name      = "vaultwarden-secret"
    namespace = var.namespace
  }
}
