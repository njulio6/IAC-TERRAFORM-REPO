
# Configure the AWS Provider
# Provider. 
#[ 1] ======> [enterprise account], sso, organ, AASUME-ROLE, # [TERRAFORM-WORKSPACES]
provider "aws" {
  region  = var.region 
  profile = "default"
}
# us-east-1 , us-west-2
# "", [ string]
# [], list