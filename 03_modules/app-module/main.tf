terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

data "template_file" "init" {
  template = "${file("app-module/userdata.sh")}"

  vars = {
    secret_value = "${var.secret_value}"
  }
}


# Create web server
resource "aws_instance" "web_server" {
  # if ami coming in use it, otherwise use ubuntu
  ami                    = length(var.ami) > 0 ? var.ami : data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.web_server.id]
  instance_type          = length(var.instance_type) > 0 ? var.instance_type : "t2.micro"
  user_data              = "${data.template_file.init.rendered}"
  tags = {
    Name = var.server_name
  }
}