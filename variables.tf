
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