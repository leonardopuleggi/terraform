variable "config1" {
  description = "config"
  type        = number
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
}

variable "environment" {
  description = "environment name"
  type        = string
}

variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "instance"
}