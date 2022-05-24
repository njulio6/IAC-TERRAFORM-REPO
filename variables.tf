
variable "cidr_block" {
  type        = string
  description = "vpc cidr block"
  default     = "10.0.0.0/16"
}
# public cidr = "10.0.0.0/24", "10.0.2.0/24", "10.0.4.0/24"
# private_cidr = "10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"

variable "region" {
  type        = string
  description = "region value"
  default     = "us-east-1"
}

variable "ami_id" {
  type        = string
  description = "ami id"
  default     = "ami-0022f774911c1d690"

}

variable "create_instance" {
  type    = bool
  default = true
}

variable "instance_types" {
  type    = list(any)
  default = ["t3.micro", "t2.micro", "t2.large"]
}

variable "pubsub_cidr" {
  default = "10.0.0.0/24"
}

variable "privsub_cidr" {
  default = "10.0.1.0/24"
}