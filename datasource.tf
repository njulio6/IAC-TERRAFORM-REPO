# datasources in terraform 
# pull down all azs in the provider block

data "aws_availability_zones" "azs" {
  state = "available"
}


# data.aws_availability_zones.azs.names
# 

