## Networking vars

variable "vpc_cidr" {
  default = "0.0.0.0/0"
}

## Tags

variable "tag_name" {
  default = "demo"
}

variable "tag_type" {
  default = "networking"
}

variable "tag_environment" {
  default = "dev"
}
