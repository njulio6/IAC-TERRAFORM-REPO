
# local 

locals {
  vpc_id = aws_vpc.kojitechs.id

}

# lifecycle_policies []

# Create a VPC
resource "aws_vpc" "kojitechs" {
  cidr_block = var.cidr_block
}

# Creating public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = local.vpc_id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "public_subnet"
  }
}

# creating private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = local.vpc_id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private_subnet"
  }
}

# resource_name      logical_name
resource "aws_instance" "web" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "terraform"
  }
}


# vpc id of
#    aws_vpc.example.id

# ATRIBUTES (arn, id)

# ec2 ( PUBLIC_IP)
#     aws_instance.web.public_ip
# vpc (vpc id)
# atributes
# data "", list []. map {}