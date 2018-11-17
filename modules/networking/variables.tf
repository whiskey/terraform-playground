## Networking vars

variable "vpc_cidr" {
  default = "0.0.0.0/0"
}

variable "vpc_public_subnet_cidr" {
  default = "0.0.0.0/0"
}

variable "vpc_private_subnet_cidr" {
  default = "0.0.0.0/0"
}

variable "vpc_public_subnet_az" {
  default = "change-me"
}

variable "vpc_private_subnet_az" {
  default = "change-me"
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
