data "sops_file" "jetbrains-hub-secrets" {
  source_file = "secrets/jetbrains-hub.sops.yaml"
}

resource "gitlab_application" "jetbrains-hub" {
  name         = "Jetbrains Hub"
  redirect_url = data.sops_file.jetbrains-hub-secrets.data["redirect-url"]
  scopes       = ["api", "read_user"]
  confidential = true
}

output "jetbrains-hub-application-id" {
  value     = gitlab_application.jetbrains-hub.application_id
  sensitive = true
}
output "jetbrains-hub-application-secret" {
  value     = gitlab_application.jetbrains-hub.secret
  sensitive = true
}
