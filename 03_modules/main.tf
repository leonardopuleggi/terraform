terraform {
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

# modules must have unique names
module "web_1" {
  source = "./app-module"

  # Input Variables
  app_name         = "web-app-1"
  environment_name = "production"
  server_name      = "server1"
  secret_value     = var.value_to_show
}

module "web_2" {
  source = "./app-module"

  # Input Variables
  app_name         = "web-app-2"
  environment_name = "dev"
  server_name      = "server2"
  secret_value     = var.value_to_show
}

# output from the module must be "re-exported"
output "public_ip_node1" {
  value = try(module.web_1.public_ip, null)
}

output "public_ip_node2" {
  value = try(module.web_2.public_ip, null)
}