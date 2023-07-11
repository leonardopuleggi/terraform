variable "region" {
  description = "Default region"
  type        = string
  default     = "eu-west-2"
}

variable "instance_name" {
  description = "Name of ec2 instance"
  type        = string
}

## Ubuntu gets overriden by value in terraform.tfvar
variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "environment" {
  description = "environment"
  type        = string
  default     = "dev"
}
