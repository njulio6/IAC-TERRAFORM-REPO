
variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  type    = list(any)
  default = ["t2.micro", "t2.large"]
}

