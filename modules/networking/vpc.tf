# VPC

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name        = "${var.tag_name}-main"
    Type        = "${var.tag_type}"
    Environment = "${var.tag_environment}"
  }
}

resource "aws_subnet" "main-public" {
  cidr_block              = "${var.vpc_public_subnet_cidr}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = "true"

  tags {
    Name = "${var.tag_name}-public"
  }
}

resource "aws_subnet" "main-private" {
  cidr_block              = "${var.vpc_private_subnet_cidr}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.tag_name}-private"
  }
}

# IGW

resource "aws_internet_gateway" "main_igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.tag_name}-igw"
  }
}

# Routing tables

resource "aws_route_table" "main_rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main_igw.id}"
  }

  tags {
    Name = "${var.tag_name}-rt"
  }
}

resource "aws_route_table_association" "main-public" {
  route_table_id = "${aws_route_table.main_rt.id}"
  subnet_id      = "${aws_subnet.main-public.id}"
}
