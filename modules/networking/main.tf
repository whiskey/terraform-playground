resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "${var.tag_name}"
    Type = "${var.tag_type}"
    Environment = "${var.tag_environment}"
  }

  # TODO: add sec groups & further networking
}
