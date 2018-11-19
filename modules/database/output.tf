output "db_id" {
  value = "${aws_db_instance.db.id}"
}

output "db_name" {
  value = "${aws_db_instance.db.name}"
}

output "db_address" {
  value = "${aws_db_instance.db.address}"
}

output "db_engine" {
  value = "${aws_db_instance.db.engine}"
}

output "db_engine_version" {
  value = "${aws_db_instance.db.engine_version}"
}

output "db_status" {
  value = "${aws_db_instance.db.status}"
}
