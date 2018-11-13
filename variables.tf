## General
variable "aws_credentials_file" {}

variable "aws_profile" {}

variable "aws_region" {
  default = "eu-west-1" # Ireland
}

### Networking
variable "vpc_cidr" {}
