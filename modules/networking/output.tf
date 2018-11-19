output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_sg_web_access" {
  description = "Security group for Web access"
  value       = ["${aws_security_group.web_access.id}"]
}

output "vpc_sg_ssh_access" {
  description = "Security group for SSH access"
  value       = ["${aws_security_group.ssh_access.id}"]
}

output "vpc_public_subnet_id" {
  description = "The PUBLIC subnet ID. The current stups supports only one public subnet."
  value       = "${aws_subnet.main-public.id}"
}

output "vpc_private_subnet_id" {
  description = "The PRIVATE subnet ID. The current stups supports only one public subnet."
  value       = "${aws_subnet.main-private.id}"
}
