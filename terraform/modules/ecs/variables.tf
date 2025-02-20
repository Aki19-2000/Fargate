variable "ecs_cluster_name" {
  description = "The name of the ECS Cluster"
  type        = string
}

variable "ecs_task_family" {
  description = "ECS Task Definition Family"
  type        = string
}

variable "ecs_execution_role_arn" {
  description = "The ARN of the ECS execution role"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "The ARN of the ECS task role"
  type        = string
}

variable "patient_service_image" {
  description = "The Docker image URL for the patient service"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where ECS tasks will run"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for ECS service"
  type        = string
}

