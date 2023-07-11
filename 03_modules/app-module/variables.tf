# General Variables

variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "eu-west-2"
}

variable "app_name" {
  description = "Name of the web application"
  type        = string
  default     = null
}

variable "environment_name" {
  description = "Deployment environment (dev/staging/production)"
  type        = string
  default     = null
}

# EC2 Variables
variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  nullable    =  false
  default     = "ami-06464c878dbe46da4"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "secret_value" {
  description = "Secret value to show on the Public IP - not really secret - just to show that it is passed from the main module to the child module"
  type        = string
  sensitive   = true
}

variable "server_name" {
  description = "Name"
  type        = string
}
