terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "local" {}
}

provider "aws" {
  region = "eu-west-2"
}

data "aws_vpc" "main" {
  tags = {
    Name = "Common VPC"
  }
}

resource "aws_instance" "instance" {
  ami           = "ami-06464c878dbe46da4" #AWS linux 2023
  instance_type = var.instance_type
  count         =  var.config1
  
  tags = {
    Name        = format("%s_%s", var.name_tag, var.environment)
    Environment = var.environment
    VPC         = "${data.aws_vpc.main.id}"
  }
}