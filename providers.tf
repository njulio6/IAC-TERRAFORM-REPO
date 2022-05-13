
# Configure the AWS Provider
# Provider. 
#[ 1] ======> [enterprise account], sso, organ, AASUME-ROLE, # [TERRAFORM-WORKSPACES]
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

# "", [ string]
# [], list