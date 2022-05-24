



# vpc id of
#    aws_vpc.example.id

# ATRIBUTES (arn, id)

# ec2 ( PUBLIC_IP)
#     aws_instance.web.public_ip
# vpc (vpc id)
# atributes
# data "", list []. map {}

# 


# [1 ,2 ,3, 4, 5, 6] = 
#  0 ,1,  2, 3, 4, 5 = 

# Meta arguments () #  
# they're use to control the behav,
#     count = []
#     for_each 
#     lifecycle policies [ ignore_changes, prevent_destroy]
#     depends_on
#     
# create_20 instances, 
# count mostly to passed contidions
# then = ? 
# else = :

# for_each =   {}
# [] this is a list object

# {}  this is dictionary

# "" thisis a string
# bool true or false

# {[]} map of list

# {[""]} map of list of string
# "t2.micro"
# "t3.micro"


''''''''''''''''''''''''''''''''''''''''
for_each = toset([])

for_each = {}



/*
variable "instance_map" {

  type = map(object({
    subnet        = string
    instance_type = string
  }))
  default = {
    "key" = [{
      instance_type = "value"
      subnet = "value"
    }]
  }
}

# for_each with map

locals {
  instances = [{
    subnet        = aws_subnet.public_subnet.id
    instance_type = "t3.micro"
    },
    {
      subnet        = aws_subnet.private_subnet.id
      instance_type = "t2.micro"
  }]
}

resource "aws_instance" "for_each_with_map" {

  for_each = toset(local.instances)

  ami           = data.aws_ami.ami.id # variables , get rid of hard the ami id in the variable block
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet

  tags = {
    Name = "terraform"
  }
}
*/

