terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
  }
}

data "kubernetes_secret" "secrets" {
  for_each = toset(var.arrs-name)
  metadata {
    name      = "${each.key}-secret"
    namespace = var.namespace
  }
}


data "kubernetes_service" "services" {
  for_each = toset(var.arrs-name)
  metadata {
    name      = each.key
    namespace = var.namespace
  }
}

data "kubernetes_secret" "cluster-secrets" {
  metadata {
    name      = "cluster-secrets"
    namespace = "flux-system"
  }
}
