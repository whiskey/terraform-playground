# a simple config file

provider "aws" {
  region                  = "${var.aws_region}"
  shared_credentials_file = "${var.aws_credentials_file}"
  profile                 = "${var.aws_profile}"
}

terraform {
  backend "s3" {}
}

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
  db_subnet_ids = ["${module.networking.vpc_subnet_ids}"]
}
