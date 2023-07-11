variable "region" {
  description = "Default region"
  type        = string
  default     = "eu-west-2"
}

## S3 bucket for TF state
# bucket name needs to be unique
variable "s3-state" {
  description = "TF state - S3 bucket name"
  type        = string
  default     = "leonardopuleggi-tf-state"
}

variable "terraform-state-locking" {
  description = "DynamoDB locking"
  type        = string
  default     = "terraform-state-locking"
}

variable "s3-key-name" {
  description = "Name of the S3 obj"
  type        = string
  default     = "terraform.tfstate"
}