
# Configure the AWS Provider
# Provider. 
#[ 1] ======> [enterprise account], sso, organ, AASUME-ROLE, # [TERRAFORM-WORKSPACES]

provider "aws" {
  region  = var.region
  profile = "default"

  default_tags {
    tags = local.mandatory_tag
  }
}
# us-east-1 , us-west-2
# "", [ string]
# [], list

