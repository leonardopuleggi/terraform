# Terraform 
Play around with Terraform and AWS free tier (apply a budget and make sure that you are not paying outside of the free tier)

## Install Terraform

https://learn.hashicorp.com/tutorials/terraform/install-cli

## AWS Account Setup

In AWS console: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication

1) create non-root AWS user
2) Add the necessary IAM roles (AmazonEC2FullAccess, AmazonDynamoDBFullAccess, AmazonRDSFullAccess, AmazonRoute53FullAccess,IAMFullAccess AmazonS3FullAccess)
3) aws configure and set the access key & secret

## Step 1 - store Terraform state file in AWS S3 

See [01_state](./01_state/README.md)

## Step 2 - Variables and output 

See [02_variables_output](./02_variables_output/README.md)

## Step 3 - Module definition and EC2 userdata

See [03_modules](./03_modules/README.md)

## Step 3 - Multi account

See [04_multi_account](./04_multi_account/README.md)