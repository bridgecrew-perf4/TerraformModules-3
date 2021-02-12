output "primary_network_interface_id" {
  description = "List of IDs of the primary network interface of instances"
  value       = aws_instance.ec2.*.primary_network_interface_id
}

output "vpc_security_group_ids" {
  description = "List of associated security groups of instances, if running in non-default VPC"
  value       = aws_instance.ec2.*.vpc_security_group_ids
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = aws_instance.ec2.*.security_groups
}

