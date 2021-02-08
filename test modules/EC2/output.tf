output "primary_network_interface_id" {
  value = aws_instance.test-ec2deployment.primary_network_interface_id
}

output "public_ip" {
  value = aws_instance.test-ec2deployment.public_ip
}
