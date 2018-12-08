# MAIN variable file

## Provider settings
variable "aws_credentials_file" {}

variable "aws_profile" {}

variable "aws_region" {
  default = "eu-west-1" # Ireland
}

## Networking
variable "vpc_cidr" {}

variable "vpc_public_subnet_cidr" {}
variable "vpc_private_subnet_cidr" {}

variable "vpc_public_subnet_az" {
  default = "eu-west-1a"
}

variable "vpc_private_subnet_az" {
  default = "eu-west-1b"
}

## Database
variable "db_username" {
  description = "db root user"
}

variable "db_password" {
  description = "db root password"
}

## Compute
variable "web_instance_type" {
  default = "t2.micro"
}

variable "ssh_public" {
  description = "path to the public ssh key"
}

variable "ssh_private" {
  description = "path to the private ssh key"
}
