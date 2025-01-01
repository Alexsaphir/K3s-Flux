variable "arrs-name" {
  description = "List of arr-applications"
  type        = list(string)
  default     = ["sonarr", "radarr", "prowlarr", "lidarr", "readarr"]
}

variable "namespace" {
  description = "Namespace"
  type        = string
  default     = "media"
}
