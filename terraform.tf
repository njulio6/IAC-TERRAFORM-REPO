

# Terraform block ( It's used to set constaint on the terraform manifest files)(Terraform not backward compartible) 

terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}