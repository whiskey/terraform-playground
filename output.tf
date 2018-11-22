# Output

## Networking
output "vpc_id" {
  value = "${module.networking.vpc_id}"
}

output "vpc_public_subnet_id" {
  value = "${module.networking.vpc_public_subnet_id}"
}

output "vpc_private_subnet_id" {
  value = "${module.networking.vpc_private_subnet_id}"
}

## Compute
output "ec2_id" {
  value = "${module.compute.ec2_id}"
}

output "ec2_public_ip" {
  value = "${module.compute.ec2_public_ip}"
}

## Database

output "db_address" {
  value = "${module.database.db_address}"
}

output "db_engine" {
  value = "${module.database.db_engine}"
}

output "db_engine_version" {
  value = "${module.database.db_engine_version}"
}

output "db_status" {
  value = "${module.database.db_status}"
}
