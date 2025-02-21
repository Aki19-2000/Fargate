output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.patient_service.arn
}

# ecs module outputs.tf
output "patient_service_id" {
  description = "The ECS patient service ARN"
  value       = aws_ecs_service.patient_service.arn
}

output "appointment_service_id" {
  description = "The ECS appointment service ARN"
  value       = aws_ecs_service.appointment_service.arn
}



