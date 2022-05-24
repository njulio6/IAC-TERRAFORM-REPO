
output "instancespub_ip" {
  value = aws_instance.kojitechs[*].public_ip
}

# understand
output "for_each_with_count" {
  value = [for id in aws_instance.kojitechs: id.public_ip]
}


# forach_ech
output "for_each" {
  value = [for id in aws_instance.for_instance: id.public_ip]
}


# splat operator with for each
output "pu" {
  value = {for key, id in aws_instance.for_instance: key=> id.public_ip}
}

