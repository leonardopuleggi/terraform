terraform {
  #############################################################
  ## Uncomment the following after the first apply to "move" the 
  ## TF state from local to cloud
  ##
  ## The backend part cannot use variables. You can use something either CLI arguments or a specific file - https://brendanthompson.com/posts/2021/10/dynamic-terraform-backend-configuration 
  #############################################################

  ## update these values as well as you did with variables
  # backend "s3" {
  #   bucket         = "leonardopuleggi-tf-state"
  #   key            = "terraform.tfstate"
  #   region         = "eu-west-2"
  #   dynamodb_table = "terraform-state-locking"
  #   encrypt        = true
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = var.s3-state
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

## S3 bucket encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_crypto_conf" {
  bucket        = aws_s3_bucket.terraform_state.bucket 
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

## dynamodb for locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.terraform-state-locking
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}