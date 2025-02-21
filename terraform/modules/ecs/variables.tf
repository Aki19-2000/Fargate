variable "ecs_cluster_name" {
  description = "Name of the ECS Cluster"
  type        = string
}

variable "ecs_task_family" {
  description = "ECS Task Definition Family"
  type        = string
}

variable "ecs_execution_role_arn" {
  description = "ECS Execution Role ARN"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ECS Task Role ARN"
  type        = string
}

variable "patient_service_image" {
  description = "Docker image URL for the patient service"
  type        = string
}

variable "appointment_service_image" {
  description = "Docker image URL for the appointment service"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for ECS services"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for ECS services"
  type        = string
}



