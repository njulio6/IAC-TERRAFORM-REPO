
# outputs ( out variouse resource attributes) # maybe 

output "vpc_id" {
  description = "vpc id"
  value       = local.vpc_id
}

# output "public_ip" {
#   description = "public ip"
#   value       = aws_instance.web.public_ip
# }

