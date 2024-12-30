output "prowlarr" {
  value     = prowlarr_download_client_sabnzbd.client
  sensitive = true
}

output "sonarr" {
  value     = sonarr_download_client_sabnzbd.client
  sensitive = true
}
