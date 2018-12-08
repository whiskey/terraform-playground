# A 'naked' EC2-based machine

resource "aws_instance" "webserver" {
  ami           = "${var.web_ami}"
  instance_type = "${var.web_instance_type}"

  subnet_id              = "${var.web_subnet_id}"
  vpc_security_group_ids = ["${var.web_vpc_security_group_ids}"]
  key_name               = "${var.web_key_name}"

  user_data = "${var.web_user_data}"
}
