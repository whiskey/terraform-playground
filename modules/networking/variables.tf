variable "vpc_cidr" {
    default = "0.0.0.0/0"
}

variable "tag_name" {
  default = "demo-networking"
}

variable "tag_type" {
  default = "networking"
}

variable "tag_environment" {
  default = "dev"
}
