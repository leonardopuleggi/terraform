terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "instance"
}

resource "aws_instance" "instance" {
  ami           = "ami-06464c878dbe46da4"
  instance_type = "t3.micro"
  count         =  "${terraform.workspace == "prod" ? 3 : 1}"
  
  tags = {
    Name = format("%s_%s", var.name_tag, terraform.workspace)
    Environment = terraform.workspace
  }
}