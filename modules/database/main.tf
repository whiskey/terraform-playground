resource "aws_db_instance" "db" {
  allocated_storage      = "${var.db_storage_size}"
  storage_type           = "${var.db_storage_type}"
  engine                 = "${var.db_engine}"
  engine_version         = "${var.db_engine_version}"
  instance_class         = "${var.db_instance_class}"
  name                   = "main_db"
  username               = "${var.db_username}"
  password               = "${var.db_password}"
  vpc_security_group_ids = []

  db_subnet_group_name = "${aws_db_subnet_group.main_subnet_grp.name}"

  final_snapshot_identifier = "main-db-final"
  skip_final_snapshot       = "true"

  tags {
    Name        = "${var.tag_name}"
    Type        = "${var.tag_type}"
    Environment = "${var.tag_environment}"
  }
}

resource "aws_db_subnet_group" "main_subnet_grp" {
  subnet_ids = ["${var.db_subnet_ids}"]
}
