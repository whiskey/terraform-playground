output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_sg_ids" {
  description = "VPC security group ids"
  value       = ["${aws_security_group.web_access.id}"]
}

output "vpc_subnet_ids" {
  description = "VPC subnet ids"
  value       = ["${aws_subnet.main-public.id}", "${aws_subnet.main-private.id}"]
}
