variable "source_file" {
  type = string
}

variable "name" {
  type = string
}

variable "use_ssl" {
  type    = bool
  default = false
}

variable "enable" {
  type    = bool
  default = true
}
variable "priority" {
  type    = number
  default = 1
}
variable "item_priority" {
  type    = number
  default = 1
}
