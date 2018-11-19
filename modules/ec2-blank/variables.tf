# EC2 webserver variables

variable "web_ami" {
  default = "change me"
}

variable "web_instance_type" {
  default = "t2.micro"
}

variable "web_subnet_id" {
  default = "change me"
}

variable "web_vpc_security_group_ids" {
  default = []
  type    = "list"
}

variable "web_key_name" {
  default     = "change me"
  description = "SSH key name. A valid key name is required."
}
