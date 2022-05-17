
# Terraform block ( It's used to set constaint on the terraform manifest files)(Terraform not backward compartible) 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Providers
# why do we need provider block(Is fo authentication and authorization)( Created user, created a role), programatic access ("secrets keys and access keys")
# we aws cli to configure and secc
provider "aws" {
region  = "us-east-1"
profile = "default"
}
# Single accounts.
# credentails (file)
# .aws

# Resource Block 
# Bring into existance what ever we need to creat

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# terraform init ()
# terraform validate ()
# terraform fmt --recursive 
# terraform plan ()
# terraform apply ()
# terraform destroy ()
