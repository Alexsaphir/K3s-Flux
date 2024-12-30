variable "ports" {
  type = map(string)
  default = {
    "sonarr"   = "8989"
    "prowlarr" = "9696"
    "radarr"   = "7878"
    "readarr"  = "8787"
    "lidarr"   = "8686"
  }
  description = "Mapping of services to their respective ports"
}

variable "domain_name" {
  type    = string
  default = "alexsaphir.com"
}
