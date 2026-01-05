variable "is4k" {
  type    = bool
  default = false
}

variable "nzbget-url" {
  type    = string
  default = "nzbget.media.svc.cluster.local"
}

variable "prowlarr-url" {
  type    = string
  default = "http://prowlarr.media.svc.cluster.local:80"
}


variable "radarr-api-key" {
  type      = string
  sensitive = true
}

variable "sonarr-api-key" {
  type      = string
  sensitive = true
}
