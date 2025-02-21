output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.patient_service.arn
}

output "patient_service_id" {
  value = aws_ecs_service.patient_service.id
}

output "appointment_service_id" {
  value = aws_ecs_service.appointment_service.id
}


