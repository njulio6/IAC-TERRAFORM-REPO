
locals {
  mandatory_tag = {
    line_of_business        = "hospital"
    ado                     = "max"
    tier                    = "WEB"
    operational_environment = upper(terraform.workspace)
    tech_poc_primary        = "udu.udu25@gmail.com"
    tech_poc_secondary      = "udu.udu25@gmail.com"
    application             = "http"
    builder                 = "udu.udu25@gmail.com"
    application_owner       = "kojitechs.com"
    vpc                     = "WEB"
    cell_name               = "WEB"
    component_name          = "kojitechs"
  }

}

data "aws_availability_zones" "azs" {
  state = "available"
}


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

# "t2.micro", "t2.large"

resource "aws_vpc" "kojitechs" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.kojitechs.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = data.aws_availability_zones.azs.names[0]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.kojitechs.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.azs.names[1]

}

resource "aws_instance" "kojitechs" {
  count = 2 # 

  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type[count.index]
  subnet_id = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id][count.index] 
}


resource "aws_instance" "element" {
  count = 30 # 

  ami           = data.aws_ami.ami.id
  instance_type = element(var.instance_type, count.index)
  subnet_id = element([aws_subnet.public_subnet.id, aws_subnet.private_subnet.id], count.index)
}

# slice() # list [1,2,3,4,5,6]
# [count.index] 
# length() 
# element()
# keys
# values 

resource "aws_instance" "for_instance" {
  for_each = toset(var.instance_type)

  ami           = data.aws_ami.ami.id
  instance_type = each.value # key
  subnet_id = aws_subnet.public_subnet.id
}

