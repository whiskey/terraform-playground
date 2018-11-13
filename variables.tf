## General
variable "aws_credentials_file" {}

variable "aws_profile" {}

variable "aws_region" {
  default = "eu-west-1" # Ireland
}

### Networking
variable "vpc_cidr" {}

### Database
variable "db_username" {
  description = "db root user"
}

variable "db_password" {
  description = "db root password"
}

variable "vpc_security_group_ids" {
  type        = "list"
  description = "db vpc security groups"
}
