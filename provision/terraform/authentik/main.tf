resource "authentik_service_connection_kubernetes" "main" {
  name  = "Local Kubernetes Cluster"
  local = true
}

resource "authentik_system_settings" "settings" {
  default_user_change_name     = false
  default_user_change_username = false
  default_user_change_email    = false
}
