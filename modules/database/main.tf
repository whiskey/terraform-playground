resource "aws_db_instance" "db" {
  allocated_storage      = "${var.db_storage_size}"
  storage_type           = "${var.db_storage_type}"
  engine                 = "${var.db_engine}"
  engine_version         = "${var.db_engine_version}"
  instance_class         = "${var.db_instance_class}"
  name                   = "db"
  username               = "${var.db_username}"
  password               = "${var.db_password}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"

  tags {
    Name        = "${var.tag_name}"
    Type        = "${var.tag_type}"
    Environment = "${var.tag_environment}"
  }
}
