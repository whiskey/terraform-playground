output "ec2_id" {
  value = "${aws_instance.webserver.id}"
}

output "ec2_public_ip" {
  value = "${aws_instance.webserver.public_ip}"
}

output "ec2_ipv6_addresses" {
  value = "${aws_instance.webserver.ipv6_addresses}"
}
