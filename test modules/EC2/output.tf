output "primary_network_interface_id" {
  value = aws_instance.ec2.primary_network_interface_id
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}
