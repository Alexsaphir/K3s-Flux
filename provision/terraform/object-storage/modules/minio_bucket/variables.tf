variable "bucket_name" {
  type = string
}

variable "is_public" {
  type    = bool
  default = false
}

variable "quota" {
  type    = number
  default = null
}

variable "owner_access_key" {
  type      = string
  sensitive = false
  default   = null
}

variable "owner_secret_key" {
  type      = string
  sensitive = true
  default   = null
}
