## Database vars
## see also: 
## https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html
## https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html

variable "db_storage_size" {
  default = 10
}

variable "db_storage_type" {
  default = "gp2"
}

variable "db_engine" {
  default = "postgres"
}

variable "db_engine_version" {
  default = ""
}

variable "db_instance_class" {
  default = "db.t2.small"
}

variable "db_username" {
  description = "root user"
}

variable "db_password" {
  description = "root password"
}

variable "db_subnet_ids" {
  type = "list"
}

## Tags

variable "tag_name" {
  default = "demo"
}

variable "tag_type" {
  default = "database"
}

variable "tag_environment" {
  default = "dev"
}
