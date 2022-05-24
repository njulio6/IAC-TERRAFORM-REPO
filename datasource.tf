# datasources in terraform 
# pull down all azs in the provider block

data "aws_availability_zones" "azs" {
  state = "available"
}


# data.aws_availability_zones.azs.names
# 

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}