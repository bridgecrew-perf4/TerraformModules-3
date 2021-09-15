#------------------------------------------------------------------------------
# ECS Service
#------------------------------------------------------------------------------
output "aws_ecs_service_name" {
  description = "The name of the ECS service"
  value       = aws_ecs_service.main.name
}

output "aws_ecs_service_cluster_name" {
  description = "The name of the ECS service"
  value       = aws_ecs_service.main.cluster
}

output "aws_ecs_service_cluster_id" {
  description = "ARN of the ECS service."
  value       = aws_ecs_service.main.id
}
