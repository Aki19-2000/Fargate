output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.patient_service.arn
}

# ecs module outputs.tf
output "patient_service_id" {
  description = "The ECS patient service ID"
  value       = aws_ecs_service.patient_service.id  # Use .id instead of .arn
}

output "appointment_service_id" {
  description = "The ECS appointment service ID"
  value       = aws_ecs_service.appointment_service.id  # Use .id instead of .arn
}

# Updated: Getting the private IP of the ECS tasks
output "patient_service_ip" {
  value = aws_ecs_service.patient_service.network_configuration[0].assign_public_ip
}

output "appointment_service_ip" {
  value = aws_ecs_service.appointment_service.network_configuration[0].assign_public_ip
}
