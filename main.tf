# a simple config file

provider "aws" {
  region                  = "${var.aws_region}"
  shared_credentials_file = "${var.aws_credentials_file}"
  profile                 = "${var.aws_profile}"
}

module "networking" {
  source = "./modules/networking"

  vpc_cidr = "${var.vpc_cidr}"
}

output "vpc_id" {
  value = "${module.networking.vpc_id}"
}