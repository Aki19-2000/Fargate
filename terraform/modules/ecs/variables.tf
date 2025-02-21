variable "ecs_cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "ecs_task_family" {
  description = "ECS Task Definition Family"
  type        = string
}

variable "ecs_execution_role_arn" {
  description = "ARN of the ECS Execution Role"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ARN of the ECS Task Role"
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
  description = "ID of the subnet"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group"
  type        = string
}
