# A simple config file

## Provider & Terraform backend
provider "aws" {
  region                  = "${var.aws_region}"
  shared_credentials_file = "${var.aws_credentials_file}"
  profile                 = "${var.aws_profile}"
}

terraform {
  backend "s3" {}
}

## One database and one naked EC2 instance

module "networking" {
  source = "./modules/networking"

  vpc_cidr                = "${var.vpc_cidr}"
  vpc_public_subnet_cidr  = "${var.vpc_public_subnet_cidr}"
  vpc_private_subnet_cidr = "${var.vpc_private_subnet_cidr}"
  vpc_public_subnet_az    = "${var.vpc_public_subnet_az}"
  vpc_private_subnet_az   = "${var.vpc_private_subnet_az}"
}

module "database" {
  source = "./modules/database"

  db_username = "${var.db_username}"
  db_password = "${var.db_password}"

  #vpc_security_group_ids = []
  db_subnet_ids = [
    "${module.networking.vpc_public_subnet_id}",
    "${module.networking.vpc_private_subnet_id}",
  ]
}

module "compute" {
  source = "./modules/ec2-blank"

  web_ami = "${lookup(var.amis, var.aws_region)}"

  web_subnet_id              = "${module.networking.vpc_public_subnet_id}"
  web_vpc_security_group_ids = "${module.networking.vpc_sg_ids}"
  web_key_name               = "${var.web_key_name}"
}
