
# local 

locals {
  vpc_id = aws_vpc.kojitechs.id

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


# local.mandatory_tag

# lifecycle_policies []

# Create a VPC

resource "aws_vpc" "kojitechs" {
  cidr_block = var.cidr_block

}

# Creating public subnet
#         "standard"     "logic_resource"
resource "aws_subnet" "public_subnet" {
  vpc_id                  = local.vpc_id    # var.
  cidr_block              = var.pubsub_cidr # what is the data(string)
  availability_zone       = data.aws_availability_zones.azs.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet" # mandatory tag withing provider block
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = local.vpc_id
  cidr_block        = var.privsub_cidr # what is the data(string)
  availability_zone = data.aws_availability_zones.azs.names[1]

  tags = {
    Name = "private_subnet" # ToDo
  }
}


# resource_name      logical_name
resource "aws_instance" "count" {
  count = var.create_instance ? 1 : 0

  ami           = data.aws_ami.ami.id # variables , get rid of hard the ami id in the variable block
  instance_type = "t3.micro"          # string
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "terraform" # ToDo
  }
}


resource "aws_instance" "for_each_with_list" {
  for_each = toset(var.instance_types)

  ami           = data.aws_ami.ami.id # variables , get rid of hard the ami id in the variable block
  instance_type = each.value
  subnet_id     = aws_subnet.public_subnet.id


  tags = {
    Name = "terraform" # ToDo
  }
}

###  What we are gonnna do for the day? 

# variables () ? ? {

#  }
# count ? ()
# for_each ()
# syntax with terraform.
# Look at data_sources( how )
