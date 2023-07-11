# General Variables
variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "eu-west-2"
}

variable "app_name" {
  description = "Name of the web application"
  type        = string
}

variable "environment_name" {
  description = "Deployment environment (dev/staging/production)"
  type        = string
  default     = "dev"
}

# EC2 Variables
variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  nullable    = true
  default     = null
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "value_to_show" {
  description = "test for sensitive data"
  type        = string
  sensitive   = true
}