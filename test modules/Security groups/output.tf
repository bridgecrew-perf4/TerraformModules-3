output "securitygroup_id" {
  value = aws_security_group.my-webserver.id
}

output "securitygroup_name" {
    value = aws_security_group.my-webserver.name
}